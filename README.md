# Guess The Flag

A simple game that presents three national flags and have the user guess which country the flag belongs to.  

![example](https://github.com/igibliss00/Guess-the-Flag-Game/blob/master/README_assets/2.png)

## Installing

Clone the project
```
git clone https://github.com/igibliss00/Guess-the-Flag-Game.git
```

## Features

### Asset Catalogs
Utilized the asset catalogs for the images of the flags.  Asset catalogs are highly optimized ways of importing and using images in your iOS projects.  Before iPhone 4 when the Retina display didn't exist, only one version of images was needed.  If the screen resolution was 320 x 480, 10 pixels meant 10 pixels and images of the that size would look the same in all iPhones.

With the introduction of the Retina display, the number of pixels were doubled.  This means that what 10 pixels by 10 pixels would look in a non-Retina device is going to be different in a Retina device.  More specifically, the length of 10 pixels are going to be halved in a Retina device compared to a non-Retina device.

In order to make the design look the same for both non-Retina devices and Retina devices, you would have to create two different versions of your design.  Apple solved this issue by introducing a concept called "points".  Point is a virtual pixel that unifies both Retina diplays and non-Retina displays by having one point be equivalent to two pixels for Retina devices. Developers still had to provide two different versions of images, but the development process was made easier because you only had to use one unit of measurement for sizes and margins and Apple would automatically decide for us which image was going to be used depending on the device that's downloading the app from the App Store (app thinning).

### Auto Layout
This project incorporates the auto layout feature that enables the design to look identical in devices of different screen sizes.  Auto layout requires at least one vertical constraint and one horizontal constraint to work.  First of the three buttons in this project had the "Top Space to Safe Area" set for the vertical constraint as well as the "Center Horizontally in Safe Area" for the horizontal constraint.  The rest two buttons had their vertical constraint set against the button right above to themselves. 

![auto layout](https://github.com/igibliss00/Guess-the-Flag-Game/blob/master/README_assets/1.png)

### UIColor
CA Layer is Apple’s Core Animation data type that manages how the app looks.  This is at a lower technical layer than UIView, a type that is a parent to things like UIButton, UITableView, etc.  In order to manipulate the border width and the color of UIButton we need to communicate to this CA Layer, more specifically the CGColor.  The problem is that CGColor doesn’t know UIButton since CGColor sits at a technical lower level than UIButton. That’s where UIColor comes in.  UIColor is able to convert to and from CGColor easily.

```
button1.layer.borderColor = UIColor.lightGray.cgColor
button2.layer.borderColor = UIColor.lightGray.cgColor
button3.layer.borderColor = UIColor.lightGray.cgColor
```

### UIAlertController
UIAlertController is a modal that can display messages and allows users to interact with by pressing buttons.  The buttons will execute a closure function provided by the developer. This projects uses the UIAlertController to display whether the user has gotten the answer right or not, the score, and execute a closure function "askQuestions". 

![UIAlertController](https://github.com/igibliss00/Guess-the-Flag-Game/blob/master/README_assets/3.png)


