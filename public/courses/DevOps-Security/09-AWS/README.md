# AWS

AWS is really popular. It's really big. It's like the Borg of cloud computing. 

## Cloud Computing

A bunch of computers connected to the internet. Besides computer storage, 
AWS offers Frameworks and tools to run complex systems. This includes
analytics, security, databases, developer tools, and more. 

**High Availability** cloud computing makes storage available anywhere 
on any device. 

**Fault Tolerant** provides the ability to get a copy of a file that may
become corrupted at one point. 

## Well Architected Framework

Using AWS you get a top quality framework maintained by pros. 

## AWS Associate Certificate

You can get your own AWS certificate!

## Data Center 

Amazon maintains the computers so you don't have to. 

- No need to maintain
- No need to store and power
- No need to expand 
- No need to employ an expert

## Virtual machines 

Allow for adding or removing machines at any time with no cost for 
installation and maintainence instantly.  

**Scalability/Elasticity** grow or shrink on demand as needed. 

## Regions and Availability Zones 

Amazon maintains data centers in regions. You can create machine 
instances in regions to decrease latency. 

- Regions 
  - A geographic Area
  - 15 Regions exist plus Gov Cloud 
  - They are dynamic and change over time
  - Some Regions may not provide some services
- Availability Zones
  - Datacenters within a region
  - Two or more per region
- Cloud front Edge location 
  - Edge location are spread across the globe 
  - Websites are delivered from the nearest edge location 
  - Improves performance 
  - Supports AWS features
    - S3 - simple storage 
    - EC2 - Elastic Cloud 
    - Amazon Elastic Load Balanacing
    - DNS - Amazon Route S3
    
**Service Offerings**

There are many services 

- Virtual Private cloud VPC
  - Route 53
    - Web based DNS
    - Provides FQDN (fully qualified domain names)
    - Provides health monitoring
  - EC2
    - Alternative to physical computer capacity 
    - An EC2 instance is a virtual server
  - Elastic Bean Stalk
    - Deploy code: Java, .NET, PHP, Node JS, Python, Ruby, Go, Docker
  - Lambda 
    - Run Code without a server or Virtual Machine
    - Cost Savings over EC2
    - Easy to use 
  - S3 (Simple Storage Service)
    - Simple File Storage
    - Use this to store any file type
- RDS (Relational Database Service)
  - Relational Cloud Database 
  - Easy to deploy and manage
  - Supports common databases SQL, MySQL, Postgres etc. 
- Dynamo DB
  - NoSQL DB
  - High Performance regardless of scale 
  - Good for gaming and IoT applications
- IAM (Identity and Access Management)
  - Controls Users Groups and Roles 
  - Configure Password Policies MFA (Multi Factor Authentication)
  - Allows fine grained access rules
  
## AWS Free Tier

- https://aws.amazon.com/

Sign In or Create a new account

- Note: this Requires a credit card.
- Note: You will get charged if you go over the free service limits!

### Create a Billing Alert

Follow these steps to setup a billing alert to notify you when your 
account reaches a your spending limit or when the free tier is 
approaching or exceeds it's usage limits. 

- Go to: Billing Dashboard
- Choose: Preferences
- Check: Receive Billing Alerts
- Check: Alert Free Tier Usage Alerts

## Security 

AWS uses a Shared Responsibility Model

- Security are performed by AWS
  - Physical Security
  - Hardware Retirement
  - Border Firewall
  - Updates and anti-virus on managed services 
  - destruction of data on retired systems
  - Access and account Management
- Security Performed by Customer
  - Guest OS Patching
  - Security Groups 
  - IAM
  - VPC (Virtual Private Cloud)
  - EC2 Instances 
  - S3
- Network Security
  - VPN from customer to AWS
  - Direct connection to AWS
  - Protection Against 
    - DDOS 
    - Man in the Middle 
    - IP Spoofing
    
## IAM 

Defines the Authentication and roles for users

- Usernames passwords and permissions
- Multi Factor Authentication
- Identity Federation 
- Temporary access

- Users Groups define Who can access people or objects 
- Roles Define Where they can access EC2, S3 buckets etc.
- What can they do?

### Identities (Users, Groups, and Roles)

Allow IAM users to connect to your AWS services. 

IAM Users - represents a person or service who interacts with AWS. 
Grant a user permissions by making it a member of a group that has 
permission policies attached to it. 
Primary useages:

- Management console
- Make Programatic requests

IAM Groups - Use groups to specify permissions for collections of users.
Any user assigned to the group has permissions assigned to the group. 
Use groups to: 

- Easily manage permissions for users

IAM Roles - have an identity with permissions, like users, unlike users 
roles don't have credentials (password, access keys.) A user can take 
on a role temporarily to assume permission for a specific task. 

Root user - Has complete unrestricted access to all resources on your 
AWS account including billing and the ability to change your password!

While this level of access is necessary when you first create your 
account, you don't need this level of access for day to day operations. 

- https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html

### IAM - Setup an admin user

These steps walk through creating an admin account with user roles 
and groups. 

Note: By default you are logging in with root permissions. Best practice 
is to delete or not generate your root access keys.  

- https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html

- Create a Custom URL
  - Under AWS Services, type IAM in the text box.
  - Click on 'IAM'
  - Click 'Customize' next to the sign-in URL to create a user friendly 
  AWS console address.
  - Create your own custom URL. 
  The URL that is presented can now be shared with other users who need 
  to sign into the AWS console and manage this account.
- Configure MFA
- You must have either an Android or iPhone
  - Click on 'Activate MFA' on your root account
  - Click on 'Manage MFA'
  - Select 'A virtual MFA Device' and click 'Next Step'
  - Install Google Authenticator or another supported MFA program on 
  your phone.
    - Scan the QR Code Shown in the AWS Console with Google 
    Authenticator. This associates your phone as an authenticator.
    - Input two different Authentication Codes and click Activate 
    Virtual MFA.
      - A new code is generated every 30 seconds. It might take a 
      couple tries be patient.
    - Click 'Finish'
- Create IAM Users
  - Click on 'Create Individual IAM Users'
  - Click on 'Next – Manage Users'
  - Click on 'Add User'
  - Choose a user name for your admin user (save it somewhere!)
  - Select the check box next to 'Programmatic access'
  - Select the check box next to 'AWS Management Console access'
    - This user can log into the management console and, can also use 
    the AWS API.
  - Create your own custom password (save this somewhere)
  - Click on 'Next: Permissions'
  - Click on 'Attach Existing Policies Directly'
  - In the Search box, type in administrator
  - Select the check box next to 'AdministratorAccess'
  - Click on 'Next: Review'
  - Click on 'Create User'
  - Save your Access Key and Secret keys
    - Download them as a CSV by clicking this option or,
    - Copy and paste them to a safe location
      - Copy the Access Key ID and save it 
      somewhere that you can easily access it.
      - Copy the Secret Access Key and save it 
      somewhere that you can easily access it.
        - Note: These are required for programmatic access to AWS.
    - Click on 'Close'
  - Attach Additional Policies to a user
    - On the left click on 'Users'
    - Click on the user that you just created
    - Click the X to the right of AdministratorAccess, and click 'Detach'
    - Click on 'Add Permission'
    - Click on 'Attach Existing Policies Directly'
    - In the search box, type in Database
    - Select the check box next to 'DatabaseAdministrator'
    - Click on 'Next: Review' at the bottom of the screen
    - Click on 'Add Permissions'
  - Create an IAM Group
    - On the left click on 'Groups'
    - Click on 'CreateNewGroup'
    - In the Group Name box create a name for your admin group. 
      - Using your first and last name is a good idea. 
    - Click on 'Next Step'
    - In the Filter box, type in 'administrator'
    - Select the check box next to 'AdministratorAccess'
    - Click on 'Next Step'
    - Click on 'Create Group'
    - Click on the group name
    - Click on 'Add users to Group'
    - Select the check box next to your User Name.
    - Click on 'Add users'
    - The user now has policies assigned based on group membership. 
    Optionally you can now remove policies that were attached 
    directly to the user.
  - Apply the IAM Password Policy
    - On the left click on 'Dashboard'
    - Click on 'Apply an IAM password policy'
    - Click on Manage Password Policy
    - Review the options available, but leave the settings at the 
    defaults.
    - Click on 'Apply Password Policy'
      - Note – this is not a secure way to configure a production 
      environment.

- Create an IAM user with Admin Permission
  - Best Practice not to use root account for management
- Configure MFA
  - Best practice with root account
- Modify IAM permission for your user account
- Create an IAM group
  - Best prctice to manage groups instead of users

Delete your Root user

https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html


