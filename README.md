# Password Generator and Manager

Welcome to the Password Generator and Manager repository! This project is designed to help users generate and manage secure passwords efficiently. It is built using JSP, Servlet, Java, and MySQL, ensuring robust and secure password handling.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Password Generation:** Create strong and secure passwords.
- **Password Storage:** Securely store passwords using encryption.
- **User Authentication:** Ensure only authorized users can access their passwords.
- **User-Friendly Interface:** Simple and intuitive design for easy navigation.

## Requirements

- Java 1.8
- Tomcat Servlet version 9
- SQL JAR file
- MySQL

## Installation

To get a local copy up and running, follow these steps:

### Prerequisites

- Java Development Kit (JDK) 8 or higher
- Apache Tomcat Server
- MySQL Database
- Maven (for dependency management)

### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/myselfvivek17/Password-Generator-and-Manager.git
   cd Password-Generator-and-Manager
   
2. **Set up the MySQL Database:**
   - Create a database named `password_manager`.
   - Run the SQL scripts in the `database` folder to set up the necessary tables.

3. **Configure Database Connection:**
   - Update the `db.properties` file with your MySQL username and password. Ensure the JDBC URL, username, and password are correctly configured for your MySQL setup.

4. **Build the Project:**
   ```bash
   mvn clean install
5. **Deploy to Tomcat:**
   - Copy the generated WAR file from the `target` directory to the Tomcat `webapps` folder.
   - Start the Tomcat server. You can do this by running the `startup.sh` script located in the Tomcat `bin` directory or by using the Tomcat Manager web application.

## Usage

1. **Access the Application:**
   - Open your web browser and go to `http://localhost:8080/Password-Generator-and-Manager`.

2. **Register/Login:**
   - Register a new account or log in with your existing credentials.

3. **Generate and Manage Passwords:**
   - Use the application to generate new passwords and manage your existing passwords securely. Follow the on-screen instructions to add, view, and modify passwords.

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact


Project Link: [https://github.com/myselfvivek17/Password-Generator-and-Manager](https://github.com/myselfvivek17/Password-Generator-and-Manager)
