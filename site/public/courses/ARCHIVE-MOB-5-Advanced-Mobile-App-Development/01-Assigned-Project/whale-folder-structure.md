# Whale iOS Folder Structure

1. Fork the starter git repo
https://github.com/Product-College-Labs/whale-ios

2. Clone your fork
```
git clone <Your fork url>
```

3. Create a new Xcode project and name it 
    ```whale-ios-<Your Name>```

4. Create the following directory structure
    - WhaleApp
        - Extensions - if you have any
        - UI
            - Cells
                - All your cell xibs and .swift files
                
            - Storyboards (if you use storyboards)
            - Scenes - below are just dummy folders, create your own scenes
                - Answer Scene
                    - AnswerViewController.swift
                    - AnswerViewController.xib
                - Activity Scene
                    - ActivityViewController.swift
                    - ActivityViewController.swift
                - All other scenes etc...
        - Networking
            - Models
            - APIClient
            - other networking related folders/files
    
    # Next - [App Architecture](../02-App-Architecture/Readme.md)
