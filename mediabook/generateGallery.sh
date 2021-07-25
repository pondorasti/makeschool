if ! command -v yq &> /dev/null; then
	echo "yq command is required (https://github.com/mikefarah/yq).";
	exit 1;
fi

documentation="["

for directory in ./tutorials/* ; do
  # Check if it's a directory
  if [ ! -d $directory ]; then
    continue;
  fi

  first_page_document=$(ls $directory | grep "^P00")
  first_page_slug=$(yq e --front-matter=extract '.a="chocolate"' "$directory/$first_page_document" | grep "^slug:" | awk -F' ' '{print $NF}')
  yq eval -i '.first_page = "'"$first_page_slug"'"' "$directory/tutorial.yaml"

  tutorial=$(yq eval '.slug = "../.'"$directory"'/"' "$directory/tutorial.yaml" | yq eval -j)

  if [ "$documentation" != "[" ]; then
    documentation+=",$tutorial"
  else
    documentation+=$tutorial
  fi
done

documentation+="]"

# echo "$documentation" | jq
echo "$documentation" | jq > ./tutorials/gallery.json
