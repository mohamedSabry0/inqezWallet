<a name="readme-top"></a>

<div align="center">

  <h3><b>InqezWallet</b></h3>

</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 About InqezWallet ](#-about-inqezwallet-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👤 Author ](#-author-)
  - [🔭 Future Features ](#-future-features-)
  - [Features in progress working on ](#features-in-progress-working-on-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show Your Support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 About InqezWallet <a name="about-inqezwallet"></a>

InqezWallet is a budget tracking app designed to assist users in managing their finances efficiently. The app enables users to track their expenses, income, and budget goals effectively.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://rubyonrails.org">Ruby on Rails</a></li>
    <li><a href="https://sass-lang.com/">Sass</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- Track expenses.
- Categorize transactions for better insights.
- User-friendly interface for easy navigation.
- Server-side validations for data integrity.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get started with InqezWallet, follow the steps below:

### Prerequisites

Ensure you have the following prerequisites installed:

- Ruby 3.2.2
- Bundler 2.5.1

### Setup

Clone this repository to your desired location:

```
git clone https://github.com/mohamedSabry0/inqezWallet.git
```

### Install

Install project dependencies:

```
bundle install
bin/rails db:create
bin/rails db:migrate
```

### Usage

Compile assets and start the server:

```
yarn build:css
bin/rails server
```

### Run tests

Run tests using:

```
rspec --format doc
```

### Deployment

<!-- Add deployment instructions -->

## 👤 Author <a name="author"></a>

👤 **Mohamed Sabry**

- GitHub: [@mohamedSabry0](https://github.com/mohamedSabry0)
- Twitter: [@mohsmh0](https://twitter.com/mohsmh0)
- LinkedIn: [in/mohamed-sabry0](https://www.linkedin.com/in/mohamed-sabry0/)

## 🔭 Future Features <a name="future-features"></a>

- Set and monitor budget goals.
- View detailed financial reports.
- Track income.
- Add support for reports sharing.
- Add input client side validations for UX.
- Add conditional root path, based on session status.
- Native icon upload support.
- Add support for multiple currencies.
- Add support for multiple languages.

## Features in progress working on <a name="todos"></a>

- [ ] Improving and refactoring tests for more coverage and expressiveness.
- [ ] Adding some UX improvements: transitions and/or animations, etc.
- [ ] Implementing a decent desktop design for the webapp.
- [ ] Implementing the left side menu to improve the navigability of the app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](link-to-issues).

## ⭐️ Show Your Support <a name="support"></a>

If you find InqezWallet helpful, kindly show your support by giving it a star or providing feedback for further improvements.

## 🙏 Acknowledgments <a name="acknowledgments"></a>

- [Design idea by Gregoire Vella on Behance](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding)
- [Font used in the design](https://www.marksimonson.com/fonts/view/proxima-nova)
- [Microverse](https://www.microverse.org/)
- [Rails Guides](https://guides.rubyonrails.org/)
- [Stack Overflow](https://stackoverflow.com/)
- [css-bundling-rails](https://github.com/rails/cssbundling-rails)
- [Testing HTML form validation](https://stackoverflow.com/a/48206413)
- Icons:
  - <a href="https://www.flaticon.com/free-icons/done" title="done icons">Done icons created by LAFS - Flaticon</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is licensed under the [MIT License](link-to-license).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
