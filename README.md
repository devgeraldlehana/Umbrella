# Umbrella #

Based on the size of the app I decided that viper would be an over kill with architecture. I decided to to use my understanding of MVVM.
I tried to refrain from using pods to limit the amount of dependencies and created one Get url session function since all calls are gets and not a genric one.

## Notable business ##

From the provided assets if weather id is in the range of the following:
* **200-781** : forest_rainy image will be used along with rain icon using the background color of #57575D
* **800** : forest_sunny image will be used along with clear icon using the background color of #47AB2F
* **801-804** : forest_cloudy image will be used along with partlysunny icon using the background color of #54717A
