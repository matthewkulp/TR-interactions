*** View this mock-up in Safari for best results. Chrome displays the filter selection in a strange manor.


NOTES ORGANIZED BY SCREEN


Next Shipment Screen:

- The arrow button opens an overlay with details of that shipment. The overlay comes out from the right. All overlays initiated by an arrow should come out from the right because that is the direction that the arrow points. 
- I will refer to this overlay as Shipment Details. The top of Shipment Details is semi-transparent and this carries through everywhere in the app except for overlays in the Taste Profile screens (because we want to support the beautiful photography of each region, grape, etc.) The semi-transparent effect is created with a gausian blur and a little bit of white added in. It is meant to imitate the iOS 6 navbar effect (present in the messages app for example).
- On the Shipment Details overlay, one can scroll. Please take note of how the semi-transparent bar functions in this scenario.
- The Undo button will undo the 'swap'. Notice that it exits left. Whenever an item is removed from a list, it exits left. Other scenarios where an item is removed: 1. the 'Remove' button on the checkout screen. 2. rating a wine on the 'My Wines' under the 'Unrated' filter.
- Notice that because you are undoing a swap that another wine is swapped back in at the bottom of this list. Notice the new wine comes in from the right.
- Also on this screen is the Parachute drop animation. Notice the slight swinging that the package does constantly. This animation starts over everytime the user navigates to the 'Next Shipment' screen. One important exception: If a user opens the nav while on the 'Next Shipment' screen and then decides to go back to the 'Next Shipment' screen. The parachute drop animation does not start over.


Navigation Screen:

- In this Mockup, one can navigate to only two screens 'Next Shipment' and 'My Wines' screens.
- Notice that their is an unrated wine indicator next to 'My Wines'. This disappears when the unrated wine is rated.
- Also notice that when there are unrated wines, touching 'My Wines' takes you 'My Wines' with the 'Unrated' filter applied. When there are no unrated wines to display, this button takes you to the 'My Wines' with the last filter the user applied (we may want it to always take you to the 'Loved it' filter.) 
Two subtle behaviors to notice:
If the last filter applied was the unrated one but there are no unrated wines to display, it takes the user to the unrated filter (because it's the last selected one) and then quickly moves them to another filter (in this case, the 'Reds' filter) 
If the last filter applied was not the unrated one and there ARE unrated wines to display, the user lands on the last filter applied and then is quickly moved to the 'Unrated' filter.


My Wines Screen:

- When a user rates a wine as 'I loved it'. Sometimes it unlocks a new section in their Taste Profile. When this happens an unlocking notification appears and then disappears. If a user we're to touch that notification, it would take them to a list of Wines that share the characteristic they unlocked. NOTE: Rate a wine as 'Loved it' in this mock-up and you will see the notification. However, if you touch it, it will do nothing. This is to save effort on my side. Please implement the way I described above.

- Notice the buy button. When a user selects the 'Give as a gift' or 'Order Now' options a checkout button notification appears. This stays persistent across all screen until the user pays or removes all items from the cart. Users should be able to touch this notification at any point and the checkout overlay should appear; however, this behavior is not present in the current Mock-up. When a user selects the 'Swap in next shipment' button, they recieve a different notification. When this notification is touched, the 'Shipment Details' overlay for the next subscription page should pop-up. ** In this mockup, this is the overlay that pops-up when the arrow is touched on the 'Next Shipment' screen.









