<p align="center">
<img src="https://user-images.githubusercontent.com/3329008/112176051-657fac80-8c15-11eb-87c1-d48fa0942392.png" /> + 
<img src="https://user-images.githubusercontent.com/3329008/114268585-0abcc200-9a17-11eb-97f7-838c9c8c6660.png" />
</p>
<p align="center">
  <a href="https://packagist.org/packages/pejmankheyri/whmcs-irnic"><img src="https://poser.pugx.org/pejmankheyri/whmcs-irnic/v/stable" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/pejmankheyri/whmcs-irnic"><img src="https://img.shields.io/packagist/dt/pejmankheyri/whmcs-irnic" alt="Total Downloads"></a>
  <a href="https://packagist.org/packages/pejmankheyri/whmcs-irnic"><img src="https://poser.pugx.org/pejmankheyri/whmcs-irnic/d/monthly" alt="Monthly Downloads"></a>
<a href="https://packagist.org/packages/pejmankheyri/whmcs-irnic"><img src="https://img.shields.io/github/license/pejmankheyri/whmcs-irnic" alt="License"></a>
</p>
<div dir="rtl">

# IR domain management module for irnic agents to use in WHMCS system

 It is a functional extension for the WHMCS hosting management system that enables the representatives of the irnic system to easily communicate with nic.ir and have all the facilities and automations.

## Installation

* Copy the contents of the `WHMCS-IRNIC` folder to the root path of the WHMCS project.
* Activate the plugin through the `Plugins` menu.
* [Configure the plugin.](https://github.com/pejmankheyri/WHMCS-IRNIC#%D8%AA%D9%86%D8%B8%DB%8C%D9%85%D8%A7%D8%AA)

## Features

* The possibility of registering the ir domain for all types of extensions in the system
* Ability to transfer, renew, lock and delete ir domains
* Management of all possible interfaces in the system by the user and otherwise by the company
* Registration of a new ID without intermediaries for all possible users in the system
* View the list of sent requests
* Management of the list of sent requests
* Management of poll requests for the automation of Nik system requests
* Logging of all the events that happened in the module
* The ability to sync domain information in the admin panel
* cron job capability to manage poll requests
* Separate pages for registering the IRNIC ID that start with the phrase IRNIC- in the main path of the module, which you can use in the user section.

## Settings

* Extract the zip file of the certificate you received from the irnic system and upload it to `modules/registrars/irnic/`.
* Open the `modules/registrars/irnic/functions.php` file and enter the token expressions ID and title of the certificate file into the __construct function at the beginning of the file and in the specified place.
* Open the `modules/registrars/irnic/Poll.php` file and enter your system database settings at the beginning of the file and in the database name, username, and password variables.
* Set the `modules/registrars/irnic/poll_cron.php` file in the cron job of your system daily

  
## Development Assistance

We welcome pull requests.

For major changes, please open an issue first so we can discuss what you want to change.

## License

GPL-3.0

</div>
