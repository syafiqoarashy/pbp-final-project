# PBD INTERNATIONAL CLASS FINAL PROJECT
## GROUP 3
1. Ammar Ash-Shiddiq - 2106656560
2. Azra Batrisyia Hisman - 2106656592
3. Matthew Rizky Hartadi - 2106720941
4. Nafis Azizi Riza - 2106658843
5. Syafiqo Arashy Octaviano - 2106657821
6. Theirry Nicole Panggabean - 2106721004

The mobile app that will be developed is a digital proceeding app for an academic conference, namely ACB-ISBE. The app will display information surrounding the conference, such as the schedule, submitted papers, events, speakers, authors, and room assignments. There are only two roles: members and non-members. Members includes participants, speakers, committee members, and anyone who is involved with the event. Once logged in, they will be given permission to view details regarding the event (such as the event rundown) and add testimonials to the home page, while non-members will only be able to view the home page that contains limited information.

## LINK
GitHub Release: https://github.com/syafiqoarashy/pbp-final-project/releases/tag/1.0.0%2B1

APK Direct Download: https://github.com/syafiqoarashy/pbp-final-project/releases/download/1.0.0%2B1/app.apk

## LIST OF MODULES AND FEATURES
### HOME PAGE - Syafiqo Arashy Octaviano
The website will have a home page. The home page will be the first thing the user will see when they open the app. It should contain enough information and features to get them familiar with the website.
These features consist of:
- Drawer
    1. The functionality of the drawer is to allow ease of access between pages/sections in the app
    2. When the user clicks on a page name on the drawer, it’ll redirect them to each respective page
    3. The drawer should always be visible and usable wherever the user goes around the app
- A Hero Section
    1. The hero section will display an image/illustration to let the users know what Conference Event the website is dedicated to
- Event Section
    1. A brief overview of the event
    2. A button will be used as a CTA(Call-To-Action) for the user to redirect them to the Events Page
- Speakers Section
    1. A button will be used as a CTA(Call-To-Action) for the user to redirect them to the Speakers Page
- Sessions Section
    1. A button will be used as a CTA(Call-To-Action) for the user to redirect them to the Sessions Page
- Venue Map
    1. the Venue Map section will provide a full map of the Conference Event venue.
    1. This will be implemented in hopes that users that are participating in the venue will have a visual representation of what the venue might be.
- Testimonials
    1. Contains the testimonials that logged users created.
    1. Non logged users will ONLY be able to view the testimonials, while logged user is capable of adding more to the testimonials.
- Footer and Sponsors
    1. Located at the bottom of the page, this footer contains details regarding the Conference Event and its sponsors

### LOGIN & REGISTER - Syafiqo Arashy Octaviano
- Login
    1. Contains the page that provides authentication for users to log in.
    1. Provides an option to register an account if the user has not yet created an aaccount
    1. Provides an option to go back to the home page
    1. Will redirect them back to the home page (logged in version) if successfully logged in.
- Register
    1. Contains the page that provides authentication for users to register an account.
    1. Will redirect them back to the login page if successfully created an account.

### EVENTS PAGE - Theirry Nicole Panggabean
The events module keeps track of the rundown schedule. This means for each event, the start and end time is recorded as well as its program title, relevant speakers and location. The user is able to interact with certain events. For example, if the event is a parallel session, the user is able to access the parallel sessions page to find out more about said event. On the other hand, if it is a plenary session with a speaker, users are able to interact with the event and find further information on the speaker. The app will retrieve the event data from the web app and display them to the user.
- When interacting with a parallel session, it should lead them to the tracks / parallel sessions page.
- When interacting with a session that has a speaker, it should lead them to the respective speaker.
To conclude, the events module will have its own page where the rundowns are filtered as required by the users, but it will also have interactivity that will lead to sessions and speakers.


### SPEAKERS - Azra batrisyia Hisman
The speakers module will display a list/cards of speakers for the events. Speakers would initially be divided into Plenary Speakers and Keynote Speakers. The module will also display a picture of the speaker, each speakers’ respective universities, and also country of origin. From each lists/cards, we can go to a more detailed page where each speakers’ session details are also displayed. Data displayed would include:

1. Speakers Profile:
    - A photo of the speaker
    - Respective universities
    - Country of Origin
2. Sessions
    - Type of speakers (Plenary/Keynote)
    - Session title/topic
    - Date and time of session
    - Location
3. Abstract (an explanation of the topic)

From this module, users would be able to gather information regarding each speaker.


### SESSIONS - Matthew Rizky Hartadi
In the sessions module, the page will display information about the topics that will be in session in the event. In each of these topics, there will be all the submitted papers related to that topic grouped based on their date of presentation. Each paper contains information about the author, presentation time and also the abstract of the paper.

The data that would be displayed in:
1. Parallel Sessions:
    - Topics of the paper
2. Sessions:
    - Submitted paper title
    - Paper Author
3. Paper Detail:
    - Paper Title
    - Author
    - Abstract of Paper


### AUTHORS - Ammar Ash Shiddiq
In the Authors modules, the page will display the authors name and also a search bar. When the user click on one of the data displayed, they will directed to a page displaying the details of the authors which are:
- Full Name
- Profile Picture
- Organization
- Country
- Email
- Short Biography
- Submission Title
The user also able to click the submission title and will be redirected to submission page in publication

## PUBLICATION - Nafis Azizi Riza
In the publication modules, the web will display the submitted papers by the authors. The data that will be displayed are title, tracks, and the author's name. User can click to each of the data, and redirected to the details page of each paper that will be displayed:
- Tracks : which category does the paper include (such as, SCE for Sustainable and Clean Energy, and etc.)
- Submission Title
- Authors
- Submission date
- Last Update date
- Keywords
- Abstract
- Location of the session
- Date and time of the session
- and the chair of the session
To be more interactive, user can perform search feature to filter the paper by title, tracks, and author.


## INTEGRATION FLOW
This app will require access to data from the web-app. This means that the app will pull data from the existing website created for the Midterm project, then display said data in the mobile app. To do so, models must be created within the app with parameters that correspond to the JSON data from the website. Via an HTTP Get request, the data will be decoded into an object.


## INSTRUCTIONS ON HOW TO BUILD, RUN & RELEASE
### BUILD
To build the app, flutter must first be installed. Once flutter and all its dependencies are installed, the app can be built.
To initialize the app, the following command is used:
flutter create <APP_NAME>
Once completed, code can be added to the main.dart file (which acts as the main file for the app), or to new files within the “lib/” folder. The app can now be run.

### RUN
To run the app locally, use the following command:
flutter run
Choose where to run the app (e.g. Windows browser, Chrome, etc.). If running on a browser, the app can be accessed through localhost.

### DEPLOY & RELEASE
The app can be deployed through Github Releases. 

#### Basic Settings for Ratification of the Flutter Application

For application publications on the App Center, the FLutter application must be signed or authorized using a key so that the released application has a guaranteed validity. Therefore, we will make a key for the application and set it up for automation so that the CI/CD script will run well.

1. Make a keystore
For Mac OS or Linux users, run the following command on the Terminal:
“keytool -genkey -v -keystore ~/release-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias release”<br><br>
For Windows users, run the following command on Command Prompt:
“keytool -genkey -v -keystore %userprofile%\release-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias release”<br><br>
This command is used to save the keystore file by the name release-keystore.jks in the home directory with an alias of release. Move the file inside the root folder application project and add the following syntax to the file .gitignore in the root folder project application so that the keystore is not counted as a file in the Git repository.

2. Open file /android/app/build.gradle

3. Look for parts buildTypes

<img width="324" alt="image" src="https://user-images.githubusercontent.com/112454126/204335995-25b4ec13-ff59-4692-b101-1f44220d90fe.png">

Change the section to the following.

<img width="327" alt="image" src="https://user-images.githubusercontent.com/112454126/204336056-116e304b-2764-4c2f-8701-49cf8633b949.png">


Until here, we have made basic arrangements for authorizing applications. Next, we will modify the GitHub Actions script ( making, if not ) and create new scripts for build on the App Center.


#### Making GitHub Actions Scripts
1. Produce a base64 string as a representation of the keystore file which we will save as an environment variable later.<br><br>
Run the command openssl base64 -in release-keystore.jks on the root folder to produce base64 string. Tapi string for the time being ( for example, using Notepad or Visual Studio Code).

2. Make repository secrets on the GitHub repository with the following specifications.<br><br>
i. GH_TOKEN contains GitHub ( Personal Access) Token from one of the repository admins for automated release.<br><br>
ii. KEY_JKS contains a base64 string from the keystore file that you made before.<br><br>
iii. KEY_PASSWORD contains the password you used when you made the keystore file.

3. Open (create, if there is no ) folder .github/workflows.

4. Create three new files with the specifications in GitHub Gist.

5. Save the file and push to the repository. Check whether the application was successfully created and released by GitHub Actions automatically.

Until here, we have secured workflow on GitHub.

