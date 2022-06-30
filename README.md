## iExtract - Resume Parser

### Project Description

A web application that can be used for parsing specific information from resumes using a Natural Language Processing API, i.e., iExtract.

#### Team members and roles

*   Zeyad Algamy - Back-end Developer & UI/UX Researcher
*   Khush Patel - Front-end Developer & UI/UX Researcher
*   Moaid Hashem - Front-end Developer
*   Tanmay Sharma - Front-end Developer & UI/UX Researcher
*   Roukaya Mabrouk - Front-end Developer
*   Ahmed Soliman - Backend Developer

### How to use (Screenshots)

```plaintext
1. The Home Screen: The user can select multiple CVs using a window dialog and add them to the application by clicking on the “Add Resumes (CVs)” button.
```

![](https://lh3.googleusercontent.com/0j_33b_vpRDe0_9Ba4VWNrztBQjksQXU52eh5BlPo_MZvXam8cbguAPTMCLvlRwL-jy3t66MNpdlEqe7OcRWhM8qErklkWKExlyPCaAwSJWZdBHv7fIVZuOQnRLr5dVgiltrn9NW_oYdfZ2_ubgINA)

```plaintext
2.  After the user adds the resumes to the application, the site will redirect to the parsed information screen. Where the user can select a resume to display the parsed information.
```

![](https://lh5.googleusercontent.com/dr_d3TQMroNntmoXUnJrOW4d8LTHiijjPbIWP8S3Ya8Xf4Te9hff2v45D-d-WpLSK5VviCoR40Hg2o5sNGI3ye954zswCyVaXlV8Ta-8Aj08B-Juwk-r2aqXOnOPZGSsnrNJ7Ga7L9IGgkmIuinR8w)

```plaintext
3. When you select a resume, the parsed information will be displayed as shown.
```

![](https://lh3.googleusercontent.com/8waUeJdZeIJpJ5Xc6j0Rx2vtKr_hzjEtvhpRZNDP2QTEd8x57DueAGX4NNfxkhhUVbEofQLF2oHAZsBQdBlyxNBmRXjMnBz3dfE5JWRwFBrXmb0Yx9nwshKfQHfYyDHOzqKaDQ4RiHA5xGxWnVPAHg)

```plaintext
4. The user can report and remove inacurate or mislabeled information.
```

![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/73012b334e484b49ec2b70c24eac4aad1ea2e6e08f83df88.png)

```plaintext
5. Parsed resumes can be exported as CSV files (Multiple or Single).
```

### Features

1.  Upload single/multiple CVs as PDF files.
2.  Extract and sort key information in CVs.
3.  Search through CVs using keywords.
4.  Export single/multiple CVs as CSV files.

### Frameworks and technologies

1.  The website is written and tested using Flutter (Dart).
2.  The deployment is done through Firebase hosting.
3.  The CVs are parsed using [CvParser](https://aqueous-anchorage-93443.herokuapp.com/CvParser) API

*   For testing:
    *   Flutter Unit Tests.
    *   Flutter Integration Tests.
    *   SonarQube.

### license

This project is licensed under the [MIT](https://github.com/InnoSWP/BS21-08-CV-Parser/blob/main/LICENSE) license.
