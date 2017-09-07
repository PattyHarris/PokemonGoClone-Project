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
    
    If you set the constraints on the button BEFORE you set the image, XCode seems to behave a
    bit better.
    
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
    
### List of Caught and Uncaught Pokemons
    
    1. Before adding real Pokemon figures to the mapView, first add the pokeball as a button
    to the mapView.  Tapping this button will segue to a view that holds a list of caught
    and uncaught Pokemons.  The segue is a "prsent modally" - the idea here is that tapping
    the button automatically brings up the next view.
    
    2. A ViewController contains the list of caught and uncaught Pokemans on a tableView
    We need to use a VC that contains a TV and not just add a TableViewController since we
    need to add a button to the bottom of the view.  Add a button that sits on top of the tableView -
    this will be a "return to map" button - so the map.png is added to assests from the Pokemon
    collection.  The layout for this button is the same as the Pokeball button.

### Core Data

    1. The Pokemon entity includes a name, caught boolean, and the Pokemon image name.
    Ensure that all attributes are NOT optional.  The default for the caught boolean is "no"
    CoreDataHelper was created to handle the Core Data methods needed for handling
    the Pokemon entities.  A helper file, CoreDataHelper, contains the code for adding and
    retrieving the core data items.

### Adding Pokemons to the Map

    1. To add th pokemons to the map, set the mapView delegate (to self, which also means the
    MapViewController needs to extend or inherit from MKMapViewDelegate).  With this, the
    mapView "view for annotation" can be overridden to provide Pokemon characters.  This also
    changes the moving icon, so we imported a "player" icon.  A check is needed to determine
    if the annotation is a "user location" - if it is, set it to the player icon.
    
    2. PokemonAnnotation is used to replace MKAnnoatation when setting up the timer - that way,
    a special Pokemon can be used for the annotation.  To make the images random, create a
    random number between 0 and the count of pokemons retrieved from the database (allpokemons).
    
### Catching a Pokemon

    1. mapView's method "did select annotation" is called when an annotation is selected.
    The selected annotation needs to be "deselected" to allow further selection - otherwise,
    you can only select the annotation once.
    
    2. Zoom in on the selected annotation (as long as it's not a trainer) and check whether
    the trainer is still on the map.
    
    3. To set the Pokemon as caught, it's a simple matter of setting caught to true and
    saving the context (I added another Core Data helper function to handle the simple task).
    
    4. Alerts are shown when the user successfully or unsuccessfully catches a Pokemon (seems
    like there is a better way to show success/failure).  On success, segue to the Pokedex VC -
    the segue needs to have an ID to performSegue withIdentifier...
    
    
### Fixing the First Time Use

    When the app is first launched, it showed the US with the normal annotation symbol.  This is
    due the the logic which sets the timer only if the "ok to use" setting has been set - first
    time, it's not going to be set.  So the logic which sets up the timer and user location
    is added to a setup function.  This function is then called if authorization has already
    been set and AFTER it's been authorized (see location manager didChangeAuthorization)
    
    
    
    
    
    
    
