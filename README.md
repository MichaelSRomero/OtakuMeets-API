<h1 align="center">
  <a href="https://github.com/MichaelSRomero/Waifu-front-end"><img src="https://github.com/MichaelSRomero/Waifu-front-end/blob/master/src/images/luvdiscLogo-font.png" alt="Otaku Meets" width="400"></a>
  <br>
</h1>

Otaku Meets is a blind-dating website for Anime enthusiasts. It is designed to help users communicate with each other based on their personality type by using the [**Myers Briggs Type Indicator**](https://www.myersbriggs.org/my-mbti-personality-type/mbti-basics/home.htm?bhcp=1). For example: you wouldn't want to approach an introvert with extroverted scenarios. Instead you would ease them in slowly and not come on too strong.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

First you must fork and clone this Repository onto your terminal. After you have done so, you can fork and clone the Client-side repo which is located here: [**Otaku-Meets-Client**](https://github.com/MichaelSRomero/Waifu-front-end)

```
<!-- API -->
git clone https://github.com/MichaelSRomero/Waifu-API.git
<!-- Front End -->
git clone https://github.com/MichaelSRomero/Waifu-front-end.git
```

### Installing

After cloning this repo, you must bundle install:

```
bundle install
```

Make sure Postgres is on & create the database:

```
rails db:create
```

Run Migrations:

```
rails db:migrate
```

Seed the database:

```
rails db:seed
```

Run the server:

```
rails s
```

After you have followed API installation guide. Move on by forking and cloning the client side followed by the instructions located here: [**Client**](https://github.com/MichaelSRomero/Waifu-front-end)

## Landing Page
<h1 align="center">
  <img src="https://github.com/MichaelSRomero/Waifu-front-end/blob/master/src/images/om-screenshot.png" alt="Otaku Meets" width="400">
  <img src="https://media.giphy.com/media/69BZCyph1rYvN5PADn/giphy.gif" alt="Otaku Meets" width="400" style="display: inline-block;">
  <br>
</h1>

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - API Back-End
* [Bcrpyt](https://rubygems.org/gems/bcrypt/versions/3.1.12) - Password Hashing
* [JWT](https://github.com/jwt/ruby-jwt) - Authentication & Authorization
* [Nokogiri](https://nokogiri.org/) - Web Scraping
* [Myers Briggs Type Indicator](https://www.myersbriggs.org/my-mbti-personality-type/mbti-basics/home.htm?bhcp=1) - Personality Types


## Authors

* **Michael Romero** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Inspiration

I built this site because I wanted to provide a different change and twist to online dating. We often first get attracted by another person via Physicalness; how they look, how they dress. And that's completely fine, but I felt the need to try and provide attraction through personalities. After all, what good is a beautiful person if they have an ugly personality?

This apps *styling* was heavily inspired by [**OKCupid**](https://www.okcupid.com/)'s landing page, signup & log in pages. As well as [**Tinder**](https://tinder.com/)'s layout design & functionality. I, by no means copied their CSS, but instead used their pages as reference and styled accordingly.
