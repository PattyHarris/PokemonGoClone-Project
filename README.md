#  Pokemon Go Clone Notes

    A application that mimics some aspects of Pokemon Go.  The goal of this tutorial
    is to learn about maps and locations.
    
    1. The first screen is a MapKitView which takes up the entire view.  To show the current
    location you need to set showsUserLocation on the mapView and also setup a
    CLLocationManager (to request usage of the user's current locatipn).  Use the
    "When in use" request - this is the most user-friendly.  We also need to set the
    custom plist option - Privacy - Location When In Use Usage Description
    
    2. Use something like http://www.latlong.net to find the longitude and latitude of
    your current location.  Use the Simulator's Debug -> Location to set the custom
    location.
    
    3. The updateCount allows the location manager to update the location several times,
    basically to get it right the first time.  Then we turn it off so that it allows the
    user to move the location and zoom in and out.  Otherwise, the location manager snaps
    back to the original location.  It's also a good idea to stop the location manager's
    location updates (so as not to drain the battery, etc.).
    
    4. The images for compass and other things are from www.flaticon.com.  If you search for "pokemon",
    click on the first image - it includes a menu item for "Pack" - click on that.  You will need to
    login.
    
    This pack is published by Roundicons Freebies, license CC 3.0 BY
    
    Drag the compass.png into the project Assets folder..this will be the image for a button
    that sits ontop of the mapView.
    
    Layout: I had to change the width and height constraints to <= otherwise there's a clipping
    warning.  That leaves a overlapping warnng which is solved with a left constraint.  These
    appear to be new to XCode 9.
    
    5. Compass button is used to center the current location in the view.  The logic for setting
    the initial location is used here as well.
    
    6. Next up, create the timer which will be used to put Pokemon's randomly on the mapView.
    To do this, use map annotations.  The timer is created during viewDidLoad with a repeating
    attribute.  In the closure for the time method, the map annotation is created.  To add a bit
    to the longitude of the center coordinate, 0.001 is about right.
    
    7. Positive and negative numbers are generated using the following:
    (Double(arc4random_uniform(200)) - 100.0) / 50000.0
    
    This gives us both positive and negative numbers - e.g. 0.003, -0.0091
    Run this in the playground to see the types of numbers generated.  You need to play around
    with the numbers used in this tutorial to make it work for your needs - e.g. we started
    the region with 1000 by 1000 and then narrowed that down to 200 by 200 (more at the street level)
    
    
    
