# 5CMenuTutorial
5C Hackweek Fall 2016 Intro to iOS Development

Welcome to hackweek! In this workshop we'll be making a 5C menu app. 

---

We'll walk you through how to make the app step-by-step but this doc has some of the steps written out for reference.

##Getting Started

Open XCode and create a new Single View application.

We'll be working with Storyboards to build our app. Select your Main.storyboard file in the lefthand menu and you'll see our main ViewController!

We'll be getting dining hall menu data from the [ASPC Menu API](https://aspc.pomona.edu/api/)

and we'll parse it with help from [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON). This is a library.

[More instructions on how this works here](https://devdactic.com/parse-json-with-swift/)

##Installing Cocoapods

Before we continue let's install [cocoapods.] (https://cocoapods.org)

Open terminal and run:

```
$ sudo gem install cocoapods
```

If that doesn't work (especially if you are running El Capitan) try:

```
$ sudo gem install -n /usr/local/bin cocoapods
```

This will allow us to use libraries that will make our lives easier! 

Next we'll make sure pods are set up by running: 

```
$ pod setup --verbose
```

You should get a bunch of output that ends in Setup completed. We'll help you troubleshoot if things get crazy.

Next we want to create a Podfile for our project. A Podfile tells our app what libraries we have added so we can use them in our code. In our case we'll be adding the SwiftyJSON library to help us organize and use the data we get from ASPC's menu API. Libraries save us time by letting us use other people's open source code. 

We want to make our Podfile in the same folder as our app so navigate to that folder in Terminal. Once you're there run:

```
$ pod init
```

This creates the Podfile. To open it in XCode run:

```
$ open -a Xcode Podfile
```

To add the SwiftyJSON library we need to add the following to our Podfile. Replace "5CMenuTutorial" with the name of your app.

```
  target '5CMenuTutorial' do
    pod 'SwiftyJSON'
  end
```

##Continuing to build our app!

###Configuring our Storyboard

Back to our storyboard. We want to use a specific subclass of ViewController called TableViewController so we can display a table of the 7 dining hall options. 

Delete the automatic ViewController Xcode created for us, including the corresponding file.

Search for a TableViewController in the bottom right menu and drag it into our storyboard.

Now that we have our TableViewController we want to embed it in a NavigationController.This will allow us to navigate between multiple screens and will set up nice things like a back button.

To do this, select your TableViewController. Next select Editor->Embed in->Navigation Controller from the top menu bars.

Now we have a navigation controller and a TableViewController.

Add a second TableViewController.

Connect the two with a segue from the tableViewCell of the first TableViewController to the second TableViewController.

###Adding files & code

More detailed instructions with pictures for a similar app structure are available [here] (https://www.ralfebert.de/tutorials/ios-swift-uitableviewcontroller/)

We need a file for each of the TableViewControllers we added to the storyboard. This is where we will further specify how our app should look and behave.

Add a new file by selecting File->New->CocoaTouch Class and filling in UITableViewController for the subclass and ViewController for the main class.

Wow! Look at all that code you get for free!

Take a look at these two methods in the code and see if you can figure out what values to return:

```Swift
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
``` 

We'll need an array to store the name of each of our dining halls:

```Swift
var diningHalls: [String] = ["Frank", "Frary", "Collins", "Scripps", "Mudd", "Pitzer", "Oldenborg"]
```

##Linking Files to Storyboard

We need to make sure our storyboard knows what code to use for each controller. Go to your storyboard. In the righthand menu click on the third icon from the left and set the appropriate class for each controller.

##Configuring the TableViewCells

Let's go back to our storyboard and set the class of our prototype cells to "Basic" for each of our TableViewControllers. A prototype cell tells your TableViewController what cells in its table should look like. 

Your app will reuse this prototype to make each item in the table. In order for the app to know what to reuse we need to give our cell a "Reuse Identifier". This is how we will reference our prototype cell. 

To change the Reuse Identifier select the cell and choose the fourth icon from the right in the top right menu. In the identifier field enter your identifier. I chose "diningHallCell" and "menuItemCell" for my two prototype cells.

##Making the cells display data

Now that we've set up our cells and can reference them we want them to actually display something! We'll do that in our TableViewController code.

We'll need to tell our app how to use our prototype cells. Here's what my code looks like, we'll walk through this together.

```Swift
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("diningHallCell", forIndexPath: indexPath)

         cell.textLabel?.text = diningHalls[indexPath.row] //display each dining hall on a different row

        return cell
    }
```

##Running our app

Now that we have some data displayed let's see what our app looks like! To run your app on a simulated device press the play button on the upper left corner of the screen.















