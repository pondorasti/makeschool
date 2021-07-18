# S3

## Working with S3

S3 (Simple Storage Service) is designed for large capacity low 
cost storage across multiple geographical regions.

What can you store on S3? Anything, images, text, audio, video, 
or other media. 

S3 stores data in the form of Objects. An object consists of:

- data
- key
- metadata

S3 has three classes of storage. 

- Standard Access - Suitable for performance with low latency. 
- Standard Infrequent Access - Suitable for long lived in frequently accessed files. 
- Glacier - Suitable for archiving data. 

Besides performance the cost associated is different for each sservice, 
Glacier is the cheapest. 

S3 is organized in buckets. A bucket is the standard unit. A bucket 
contains an Object with it's data and metadata. 

S3 stores data in geographical regions. Storing data in a region 
that is closer to your customers increases performance. The 
services offered and costs vary with region. 

S3 allows data to be replicated across regions. 

### Why use S3?

Use S3 when you need a scalable storage solution for digital files. 

### Objectives 

- Make buckets
- Upload files
- Set permission on buckets
- Enable versioning

## S3 Buckets

### Create an S3 Bucket

Log into the AWS Console. (You may need to verify your account!)

Under Storage, Click on S3

Click on Create Bucket

Name your bucket. (You'll need a name that is unique across all of S3)
You can use your name and the date, or your web domain. Domain names 
are unique. 

Click Next

At the Properties screen, do not change any of the default settings.

Click Next

Under Manage Public Permissions choose Grant Public Access to this Bucket.
This makes the content of this bucket available publicly to the world. 

Click Next

Click on Create Bucket

Click on the bucket you just created

Review the Properties, Permissions, and Management

Click on Amazon S3, then click your bucket name. 

Click on Upload at the top left – Be aware that there are limitations with the 
free tier. https://aws.amazon.com/govcloud-us/pricing/s3/
Adding data beyond the scope of this lab may result in charges.

Click on the Add Files

Upload your Sample HTML and Sample Image files.

Click Next

Under Manage Public Permissions, Choose Grant Public Read Access to these Objects

Click Next

Do not change the storage class or encryption settings.

Click Next

Click Upload

Wait for the upload to complete. You may need to click the refresh button 
at the top right.

Click on the name of your image file.

You should now be at the Overview screen for this object.
At the bottom you should see a link for the file. 

Right-click the file and choose Open in New Window. 
Does it open? – You set permission when you uploaded the file, so it is accessible.

Return to the AWS Console (Close the new browser window that just opened) – 
You should still be in your bucket, and the image file should be selected.

Set permissions on the bucket

On the right, click on Permissions

Click on the Circle next to Everyone

This file will be available to anyone on the internet

A box appears on the right. Uncheck the box next to Read object

Click on the Overview tab

At the bottom you should see a link for the file. 
Right-click the file and choose Open in New Window. Does it open?

Move the image file to the Infrequent Access storage class and Encrypt it.
Infrequent access is billed at a lower rate and is slower to access. 

Click on the Properties tab

Under Storage Class, click on Standard

Select Standard-IA, and click Save

Click on Encryption

Click on AES-256, and click Save

The file is now encrypted on the server. You might use this as part of a 
compliance requirement. 

Create a Sub-Folder

Scroll to the top of the screen and click on the folder name

Click on + Create Folder

Create a folder called 'images'

Click Save

To the left of each file click the box to select the files.

Right-click the group of files, and choose Cut

Click on the 'images' folder

Click on More, and then choose Paste

Click Paste

### S3 Versioning

Make a new html file and generate a simple web page. 

Save the file. 

Log into the AWS Console.

Log into the AWS console and verify that the correct region is selected
Under Storage Click on S3

Click on your bucket

Click on the Upload button at the top left

Click on Add Files

Browse to the html file you just created and double click it
Click on the Upload button at the bottom left
Verify that the file is now displayed in the list of files

Get the address and visit this file in a web browser. 

Configure Versioning and Delete the Test File. Yes, delete it. 

Click on the link for your bucket (at the top left, below the Create Folder button)

Click on Properties at the top

Click on Versioning

Select Enable Versioning and click Save

### Delete a file that has versioning enabled. 

Click on Overview folder at the top left

You should now see Hide and Show buttons above the files listed

Click on the Show button to see all versions of the existing files

Click on the Hide button to see the current version of existing files

Right Click on the file and choose Delete

Hit Delete at the pop up window

Notice that your html file is gone!

Click on the Show button to see all versions of the existing files

Click on the refresh icon at the top right (next to the transfers button)
Notice that the html document is actually still present.

There will be two versions of the file – the original, and the **delete marker**. 
The top version should be the delete marker. The file was marked as deleted, 
but the original version is still there. The delete marker basically means 
"Do not display this file"

Right Click the Delete Marker and choose Delete
Hit Delete at the pop up window

Click on the refresh icon at the top right (next to the transfers button)
Click on the Hide button to see all versions of the existing files
Notice that your html file is back as if it was never deleted.

You can't delete files that have versioning enabled! 

Make a Change to the test file

Make some changes to your html file. 

Type version 2 somewhere in the document and save it

In the AWS console Click on the Upload button at the top left

Click on Add Files

Browse to the html file you just modified and double click it

Click on Upload

Click on the Show button to see all versions of the existing files

Click on the refresh icon at the top right

Do you now see multiple versions of the same file?

View the file. 

Use permissions to make the file a Read Object. 

Then view it again. 

Set permissions again and remove Read Object.

### Cross-Region Replication

You'll use this when you want to store data reduntantly. This can 
be a requirement for some jobs, legal compliance, and security. 

#### Configure Cross-Region Replication

Log into the AWS console and verify that the correct region is selected

Enable Cross-Region Replication

Under Storage Services, Click on S3

Click on your bucket

Click on the Properties tab

Verify that Versioning is already enabled (this is required for Cross Region Replication)

Click on the Management tab

Click on Replication

Click on + Add Rule

Ensure that your bucket is the source bucket

Click Next

Click in the text box where it says Destination Bucket and click on Create New Bucket
Name the new bucket use the same name as your first bucket and add 'tokyo' at the end.
Choose Asia Pacific (Tokyo) as the destination region

Click Next

Configure the Required IAM Role
Click in the text box where it says Select a Role and click on Create New Role
Click Next
Click Save

At the top left click on Amazon S3
Your new bucket might not show up. If it is missing click the refresh button at the top right
Verify that your Tokyo bucket is now present.
Examine Bucket Contents

Click on your original bucket

At the top left click on Amazon S3
Click on your Tokyo bucket

It should be empty, because you have not uploaded any new files since you enabled Cross-Region replication

At the top left click on Amazon S3
Click on your original bucket
Click on Upload
Click on Add Files

Choose a small file that you can use to test replication

Click on Upload

When it is uploaded, Browse to the Tokyo bucket
The new file should be present in this bucket.
You may need to hit refresh at the top right
Go back to the home screen of the AWS Console.


### S3 LifeCycles

Configure S3 LifeCycles

Log into the AWS console and verify that the correct region is selected

Under Storage Services, Click on S3

Click on your primary bucket
Click on the Management tab at the top
Click on Lifecycle
Click on + Add Lifecycle Rule
Under Rule Name, type Testing
Click Next

Check the box next to Current version
Click on '+ Add Transition' button 
Configure the following transitions:
'Transition to Standard-IA' after 30 days
Click on '+ Add Transition' button 
'Transition to Glacier after' 365 days

Check the box next to Previous versions
Click on '+ Add Transition' button
Configure the following transitions:
'Transition to Standard-IA after' 30 days
Click on '+ Add Transition' button
'Transition to Glacier' after 365 days
Click Next

Check the box next to Current version and the box next to Previous Versions
Configure current versions of objects to expire after 700 days
Permanently delete previous versions after 725 days
Click Next
Click Save

Go back to the home screen of the AWS Console.