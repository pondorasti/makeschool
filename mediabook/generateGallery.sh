if ! command -v yq &> /dev/null; then
	echo "yq command is required (https://github.com/mikefarah/yq).";
	exit 1;
fi

# Initial Cleanup
rm -rf "./static/tutorials/"
mkdir "./static/tutorials/"

documentation="["

for directory in ./tutorials/* ; do
  # Check if it's a directory
  if [ ! -d $directory ]; then
    continue;
  fi
  
  # Add cover image to static assets
  cover_image=$(yq eval "$directory/tutorial.yaml" | grep "^cover:" | awk -F' ' '{print $NF}')
  cover_image=$(sed -e 's/^"//' -e 's/"$//' <<< "$cover_image")
  mkdir "./static/$directory"
  cp "$directory/assets/$cover_image" "./static/$directory"

  # Update yaml file inline with first page slug
  first_page_document=$(ls $directory | grep "^P00")
  first_page_slug=$(yq e --front-matter=extract "$directory/$first_page_document" | grep "^slug:" | awk -F' ' '{print $NF}')
  yq eval -i '.first_page = "'"$first_page_slug"'"' "$directory/tutorial.yaml"

  # Add tutorial slug and export to json
  tutorial=$(yq eval '.slug = "'"$directory"'/"' "$directory/tutorial.yaml" | yq eval -j)

  if [ "$documentation" != "[" ]; then
    documentation+=",$tutorial"
  else
    documentation+=$tutorial
  fi
done

documentation+="]"

# echo "$documentation" | jq
echo "$documentation" | jq > ./tutorials/gallery.json
