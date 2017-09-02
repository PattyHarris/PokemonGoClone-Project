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
    back to the original location.
    
    4. The images for compass and other things are from www.flaticon.com.  If you search for "pokemon",
    click on the first image - it includes a menu item for "Pack" - click on that.  You will need to
    login.
    
    This pack is published by Roundicons Freebies, license CC 3.0 BY
    
    Drag the compass.png into the project Assets folder..this will be the image for a button
    that sits ontop of the mapView.
    
    5.
