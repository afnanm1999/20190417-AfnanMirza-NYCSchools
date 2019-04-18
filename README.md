## 20190417-AfnanMirza-NYCSchools

<img src="https://raw.githubusercontent.com/afnanm1999/20190417-AfnanMirza-NYCSchools/master/20190417-AfnanMirza-NYCSchools/Supporting%20Files/logo.png" width="250">

### Screenshots

<img src="https://raw.githubusercontent.com/afnanm1999/20190417-AfnanMirza-NYCSchools/master/Screenshots/img1.png" width="250"> <img src="https://raw.githubusercontent.com/afnanm1999/20190417-AfnanMirza-NYCSchools/master/Screenshots/img2.png" width="250"> <img src="https://raw.githubusercontent.com/afnanm1999/20190417-AfnanMirza-NYCSchools/master/Screenshots/img3.png" width="250">

<img src="https://raw.githubusercontent.com/afnanm1999/20190417-AfnanMirza-NYCSchools/master/Screenshots/img4.png" width="250"> <img src="https://raw.githubusercontent.com/afnanm1999/20180817-AfnanMirza-NYCSchools/master/Screenshots/img5.png" width="250">

### Features

- Made the Application IPhone X Compatible.
- Added Custom Functions in Utils.swift file. These functions are used to make sorting and fetching of JSON Data from the API easier.
- All of UITableViewCells were put into a Separate Swift & Xib File to make the app easier to navigate as well as making it easier to read the code.
- Added Extensions inside of Extensions.swift file. These Extensions are used to make it easier and quicker to customize the app.
- Created a Custom Launch Screen Logo for the application.
- Card View with Shadows
- Added UISearchBar & UISearchController to make it easier for the user to find a certain school inside of the application.
- Users can call the school by simply tapping the schools phone number on the details View Controller (User will have to run the application on a Real Device in order for this to function properly. ).
- Users can navigate to the school simply by tapping on the Address label on the Initial Screen.
- In the Details View Added These Details:
- Schools SAT Scores
- Schools Overview
- Schools Contact Information
- MapView with Schools location pinpointed

### Technical Specifications

- Swift Version: <a href="https://swift.org/blog/swift-4-2-released/" target="_blank">4.2</a><br/>
- XCode Version: <a href="https://developer.apple.com/documentation/xcode_release_notes/xcode_10_2_release_notes" target="_blank">10.2</a><br/>
- Design Pattern: <a href="https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel" target="_blank">MVVM</a>
- Logo Created Using: <a href="https://www.sketch.com/" target="_blank">Sketch</a><br/>

### How to Use the app

In order to test the app, project files need to be opened in Xcode 10.2<br/>
There is no need to configure anything inside of the application source code. The project is already configured and can be run directly on a simulator of your choice. when the app first launches it will fetch the School's Data from the City of New York websites API. Once the data has been fetched successfully it will then list all of the schools in a UITableView. Users can also slide down on the Table View which will reveal a Search Bar in the Navigation bar. User can use that search bar to search for schools. If the user doesn't want to search for any schools they dont have to.  Users can simply go ahead and click on a school of their choice. This action will present a new View Controller with the Selected Schools SAT Scores and other information.


### Instructions

**Coding Challenge: NYC Schools**

**GOAL** : Verify candidate can provide a technical solution and follow instructions

**REQUIREMENTS** :

These requirements are rather high-level and vague. If details are omitted, it is because we will be happy with any of a wide variety of solutions. Don&#39;t worry about finding &quot;the&quot; solution. Feel free to be creative with the requirements. Your goal is to impress (but do so with clean code).

Create a browser based or native app to provide information on NYC High schools.

1. Display a list of NYC High Schools.
1. Get your data here: [https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2](https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2)
2. Selecting a school should show additional information about the school
1. Display all the SAT scores - include Math, Reading and Writing.
1. SAT data here: [https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4](https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4)
2. It is up to you to decide what additional information to display

When creating a name for your project, please use the following naming convention:

**YYYYMMDD-[First&amp;LastName]-NYCSchools** **(**_Example: 20180101-DanielleBordner-NYCSchools)_

In order to prevent you from running down rabbit holes that are less important to us, try to prioritize the following:

**What is Important**

- Proper function – requirements met.
- Well constructed, easy-to-follow, commented code (especially comment hacks or workarounds made in the interest of expediency (i.e. // given more time I would prefer to wrap this in a blah blah blah pattern blah blah )).
- Proper separation of concerns and best-practice coding patterns.
- Defensive code that graciously handles unexpected edge cases.

**What is Less Important**

- Demonstrating technologies or techniques you are not already familiar with.

**Bonus Points!**

- Unit Tests
- Additional functionality – whatever you see fit.

**iOS:**

- For applications that include CocoaPods with their project code, having the Pods included in the code commits as source is recommended. (Even though it goes against the CocoaPods general rules).
- Be sure to use safe area insets.
- Make sure your app is compatible with iPhone X.

**Android:**

- Make sure you are correctly handing any necessary permissions.
- Please make sure you are using Java. If you want to demonstrate the use of Kotlin, we&#39;d rather you use a combination of both.

As mentioned, you are not expected to function in a vacuum. Use all the online resources you can find, and please do contact us with questions or for interim feedback if you desire.






