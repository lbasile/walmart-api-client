# Walmart Open API Test Client

Sample technical iOS project asynchronously gets, parses, and displays Walmart products in a tableview with infinite scrolling based on a search query.

## Overview
Goals:
1. Work with the iOS network stack without using an already existing framework. I do notably use an image downloader library because it also comes with cacheing, since this project is image heavy.
2. Try out the MVCC (Model View Controller Coordinator) pattern, as taught by Aijaz Ansari as an MVVM-like pattern that breaks away from Massive View Controllers and closer follows SOLID principles. See Aijaz's talk here: https://www.slideshare.net/AijazAnsari2/improving-testing-speed-and-scope-with-the-proper-use-of-mvc-and-a-coordinator
3. Implement TDD style with Unit Tests

## Environment
- Built for Swift 4, iOS 11

## Requirements
### Install Carthage
- `brew update` and `brew install carthage`

### Download and Build Dependencies
- `carthage update`
- The expected dependencies are already added to the project.

## Credits
 - [Walmart© Developer Open API](https://developer.walmartlabs.com/member/register)