# This imports all the layers for "2014.9" into 20149Layers
myLayers = Framer.Importer.load "imported/2014.9"

# Use the Framer library https://github.com/facebook/shortcuts-for-framer
Utils.domLoadScriptSync("framer/library.js")
Framer.Shortcuts.initialize myLayers
	
# Setting objects
menu = myLayers["menu"]
menu2 = myLayers["menu2"]
myWinesScreen = myLayers["myWinesScreen"]
nextShipmentScreen = myLayers["nextShipmentScreen"]
nextShipment = myLayers["nextShipment"]
nextShipmentSelected = myLayers["nextShipmentSelected"]
myWines = myLayers["myWines"]
myWinesSelected = myLayers["myWinesSelected"]
scrollVeil = myLayers["scrollVeil"]
scrollVeil2 = myLayers["scrollVeil2"]
xClose = myLayers["xClose"]
next = myLayers["next"]
shipmentDetails = myLayers["shipmentDetails"]
overlay = myLayers["overlay"]
shipmentFeed = myLayers["shipmentFeed"]

chuteBox = myLayers["chuteBox"]
tracker = myLayers["tracker"]
daysLeft = myLayers["daysLeft"]
trail = myLayers["trail"]

buy = myLayers["buy"]
buyCancel = myLayers["buyCancel"]
buyOptions = myLayers["buyOptions"]
escapeTap2 = myLayers["escapeTap2"]

rateMenu = myLayers["rateMenu"]
rate = myLayers["rate"]
frown = myLayers["frown"]
okay = myLayers["okay"]
heart = myLayers["heart"]
iLovedItText = myLayers["iLovedItText"]
itWasOkayText = myLayers["itWasOkayText"]
notForMeText = myLayers["notForMeText"]
iLovedIt = myLayers["iLovedIt"]
itWasOkay = myLayers["itWasOkay"]
notForMe = myLayers["notForMe"]
cancel = myLayers["cancel"]
escapeTap = myLayers["escapeTap"]

rateMenu2 = myLayers["rateMenu2"]
rate2 = myLayers["rate2"]
frown2 = myLayers["frown2"]
okay2 = myLayers["okay2"]
heart2 = myLayers["heart2"]
iLovedItText2 = myLayers["iLovedItText2"]
itWasOkayText2 = myLayers["itWasOkayText2"]
notForMeText2 = myLayers["notForMeText2"]
iLovedIt2 = myLayers["iLovedIt2"]
itWasOkay2 = myLayers["itWasOkay2"]
notForMe2 = myLayers["notForMe2"]
cancel2 = myLayers["cancel2"]
escapeTap3 = myLayers["escapeTap3"]

cancelUnswap = myLayers["cancelUnswap"]
regionUnlocked = myLayers["regionUnlocked"]
checkout = myLayers["checkout"]
checkout2 = myLayers["checkout2"]
buyMenu = myLayers["buyMenu"]
undo = myLayers["undo"]
youSure = myLayers["youSure"]
swappedWine = myLayers["swappedWine"]
notSwappedWines = myLayers["notSwappedWines"]
yesUnswap = myLayers["yesUnswap"]
newWineCell = myLayers["newWineCell"]
invite = myLayers["invite"]
filtersRedsBold = myLayers["filtersRedsBold"]
filtersUnratedBold = myLayers["filtersUnratedBold"]
reds = myLayers["reds"]
unrated = myLayers["unrated"]
wineCellRed = myLayers["wineCellRed"]
wineCell = myLayers["wineCell"]

# Setting variables
buttonActive = false
checkoutActive = false
isAnUnratedWine = true

storedSymbol = frown
storedPhrase = tapToRateText
storedSymbol2 = okay2
storedPhrase2 = itWasOkayText2

minimizedScreenY = 1031
offBottomY = 1136
notificationHeight = 88
lastYPosition = 0
ratingPhraseMove = 10
startingSymbolRotation = -90
timeBetween = .5
symbolAnimationTime = .1
phraseAnimationTime = .2
filtersTime = .18

navTime = .3
navCurve = 'spring'
navTension = 100
navFriction = 19
navVelocity = 4

redsDisplaced = filtersRedsBold.originalFrame.x + 163
filtersRedsBold.x = redsDisplaced
reds.opacity = 0
wineCellRedDisplaced = wineCellRed.originalFrame.x + 640
wineCellRed.x = wineCellRedDisplaced

shipmentDetails.x = 640
scrollVeil2.opacity = 0
shipmentFeed.y = 106

nextShipment.opacity = 0
nextShipmentScreen.y = - notificationHeight
myWinesSelected.opacity = 0
myWinesScreen.sendToBack()

youSure.x = 640
youSure.opacity = 0	
newWineCell.x = 640

tracker.y = 543
chuteBox.originX = .5
chuteBox.originY = 0
direction = 1
trailHiddenY = 510
daysLeft.opacity = 0
daysLeftStartScale = .9
daysLeft.scale = daysLeftStartScale
trail.y = trailHiddenY
chuteBox.y = chuteBox.originalFrame.y - 45
daysLeft.y = daysLeft.originalFrame.y - 45

checkout.opacity = 0
checkout2.opacity = 0
regionUnlocked.opacity = 0

buyMenu.opacity = 0
buyMenu.y = offBottomY

rateMenu.opacity = 0
rateMenu.y = offBottomY
frown.opacity = 0
frown.rotationZ = startingSymbolRotation
okay.opacity = 0
okay.rotationZ = startingSymbolRotation
heart.opacity = 0
heart.rotationZ = startingSymbolRotation
notForMeText.opacity = 0
itWasOkayText.opacity = 0
iLovedItText.opacity = 0

rateMenu2.opacity = 0
rateMenu2.y = offBottomY
frown2.opacity = 0
frown2.rotationZ = startingSymbolRotation
okay2.opacity = 1
heart2.opacity = 0
heart2.rotationZ = startingSymbolRotation
notForMeText2.opacity = 0
itWasOkayText2.opacity = 1
iLovedItText2.opacity = 0

# Setting up the parachute mask
parachuteMask = new Layer width: 640, height: 420, y: 632, backgroundColor: "none"
nextShipmentScreen.addSubLayer(parachuteMask)
parachuteMask.addSubLayer(trail)
parachuteMask.addSubLayer(chuteBox)
parachuteMask.addSubLayer(daysLeft)

# Setting up scroll for shipmentDetails (the positioning of scrollMask eludes me)
scrollMask = new Layer width: 680, height: 1030, y: 146, x: 0, backgroundColor: "none"
shipmentDetails.addSubLayer(scrollMask)
scrollMask.addSubLayer(shipmentFeed)
scrollMask.scrollVertical = true




# Checking to see if nav is open or closed when clicked.
menu.on Events.TouchStart, ->
	if buttonActive then openShipment() else minimizeShipment()
menu2.on Events.TouchStart, ->
	if buttonActive then openMyWines() else minimizeMyWines()
nextShipment.on Events.TouchStart, ->
	openShipment()
myWines.on Events.TouchStart, ->
	openMyWines()		
next.on Events.TouchStart, ->
	openShipmentDetails()
xClose.on Events.TouchStart, ->
	closeShipmentDetails()

	
rate.on Events.TouchStart, ->
	openRateMenu()	
escapeTap.on Events.TouchStart, ->
	cancelRateMenu()
cancel.on Events.TouchStart, ->
	cancelRateMenu()	
notForMe.on Events.TouchStart, ->
	cancelRateMenu()
	utils.delay(timeBetween, notForMe())
itWasOkay.on Events.TouchStart, ->
	cancelRateMenu()
	utils.delay(timeBetween, itWasOkay())
iLovedIt.on Events.TouchStart, ->
	cancelRateMenu()
	utils.delay(timeBetween, iLovedIt())
	utils.delay 1, -> regionNotification()


rate2.on Events.TouchStart, ->
	openRateMenu2()
escapeTap3.on Events.TouchStart, ->
	cancelRateMenu2()
cancel2.on Events.TouchStart, ->
	cancelRateMenu2()	
notForMe2.on Events.TouchStart, ->
	cancelRateMenu2()
	utils.delay(timeBetween, notForMe2())
itWasOkay2.on Events.TouchStart, ->
	cancelRateMenu2()
	utils.delay(timeBetween, itWasOkay2())	
iLovedIt2.on Events.TouchStart, ->
	cancelRateMenu2()
	utils.delay(timeBetween, iLovedIt2())
	utils.delay 1, -> regionNotification()

	
buy.on Events.TouchStart, ->
	openBuyMenu()	
buyCancel.on Events.TouchStart, ->
	cancelBuyMenu()
escapeTap2.on Events.TouchStart, ->
	cancelBuyMenu()
buyOptions.on Events.TouchStart, ->
	cancelBuyMenu()
	openCheckout()


buy2.on Events.TouchStart, ->
	openBuyMenu()


undo.on Events.TouchStart, ->
	openYouSure()
cancelUnswap.on Events.TouchStart, ->
	closeYouSure()	
yesUnswap.on Events.TouchStart, ->
	closeYouSure()
	utils.delay .3, -> removeWineCell()

	
reds.on Events.TouchStart, ->
	slideToReds()	
unrated.on Events.TouchStart, ->
	slideToUnrated()
	



slideToReds = ->
	reds.opacity = 1
	unrated.opacity = 0
	filtersRedsBold.animate
		properties:
			x: filtersRedsBold.originalFrame.x
		time: filtersTime
		curve: 'bezier-curve'
	filtersUnratedBold.animate
		properties:
			x: -158
		time: filtersTime
		curve: 'bezier-curve'
	wineCellRed.animate
		properties: 
			x: wineCellRed.originalFrame.x
		time: filtersTime
		curve: 'bezier-curve'
	if isAnUnratedWine then wineCell.animate
		properties:
			x: -640
		time: filtersTime
		curve: 'bezier-curve'


slideToUnrated = ->
	reds.opacity = 0
	unrated.opacity = 1
	filtersRedsBold.animate
		properties:
			x: redsDisplaced
		time: filtersTime
		curve: 'bezier-curve'
	filtersUnratedBold.animate
		properties:
			x: filtersUnratedBold.originalFrame.x
		time: filtersTime
		curve: 'bezier-curve'
	if isAnUnratedWine then wineCell.animate
		properties:
			x: wineCell.originalFrame.x
		time: filtersTime
		curve: 'bezier-curve'
	wineCellRed.animate
		properties: 
			x: wineCellRedDisplaced
		time: filtersTime
		curve: 'bezier-curve'	


openCheckout = ->
	checkoutActive = true
	checkout.opacity = 1
	checkout2.opacity = 1	
	myWinesScreen.animate
		properties:
			y: 0
		time: .4
		curve: 'bezier-curve'
	invite.animate
		properties:
			y: invite.originalFrame.y - notificationHeight
		time: .4

	
removeWineCell = ->
	slideLeft = swappedWine.animate
		properties:
			x: -640
		time: .3
		curve: 'bezier-curve'
	slideLeft.on 'end', ->
		moveUp = notSwappedWines.animate
			properties: 
				y: notSwappedWines.originalFrame.y - 357
			time: .7
			curve: 'bezier-curve'
		moveUp.on 'end', ->
			newWineCell.animate
				properties:
					x: newWineCell.originalFrame.x
				time: .3	


openYouSure = ->
	youSure.x = youSure.originalFrame.x
	youSure.bringToFront()
	youSure.animate
		properties:
			opacity: 1
		time: .1

	
closeYouSure = ->
	youSureFadeOut = youSure.animate
		properties:
			opacity: 0
		time: .1
	youSureFadeOut.on 'end', ->
		youSure.x = 640

	
# Opening the buy menu		
openBuyMenu = ->
	buyMenu.bringToFront()
	buyMenu.y = 0
	buyMenu.animate
		properties:
			opacity: 1
		time: .1


cancelBuyMenu = ->
	buyMenuExit = buyMenu.animate
		properties:
			opacity: 0
		time: .1
	buyMenuExit.on 'end', ->
		buyMenu.y = offBottomY
	
	
notForMe = ->
	#fade out the stored symbol and fade in selected symbol
	fadeOutStoredSymbol = storedSymbol.animate
		properties:
			opacity: 0
			rotationZ: 90
			scale: .6
		time: symbolAnimationTime	
	fadeOutStoredSymbol.on 'end', ->
		storedSymbol.rotationZ = startingSymbolRotation
		frown.animate
			properties:
				opacity: 1
				rotationZ: 0
				scale: 1
			time: symbolAnimationTime
		storedSymbol = frown
	#fade out stored phrase and fade in selected phrase
	utils.delay .2, ->
		fadeOutStoredPhrase = storedPhrase.animate
			properties:
				opacity: 0
				y: storedPhrase.originalFrame.y - ratingPhraseMove
			time: phraseAnimationTime	
		fadeOutStoredPhrase.on 'end', ->
			notForMeText.animate
				properties:
					opacity: 1
					y: notForMeText.originalFrame.y
				time: phraseAnimationTime
			storedPhrase = notForMeText
	utils.delay 1.5, ->
		wineCell.animate
			properties:
				x: wineCell.originalFrame.x - 640
			time: filtersTime
			curve: 'bezier-curve'
		isAnUnratedWine = false


notForMe2 = ->
	#fade out the stored symbol and fade in selected symbol
	fadeOutStoredSymbol = storedSymbol2.animate
		properties:
			opacity: 0
			rotationZ: 90
			scale: .6
		time: symbolAnimationTime	
	fadeOutStoredSymbol.on 'end', ->
		storedSymbol2.rotationZ = startingSymbolRotation
		frown2.animate
			properties:
				opacity: 1
				rotationZ: 0
				scale: 1
			time: symbolAnimationTime
		storedSymbol2 = frown2
	#fade out stored phrase and fade in selected phrase
	utils.delay .2, ->
		fadeOutStoredPhrase = storedPhrase2.animate
			properties:
				opacity: 0
				y: storedPhrase2.originalFrame.y - ratingPhraseMove
			time: phraseAnimationTime	
		fadeOutStoredPhrase.on 'end', ->
			notForMeText2.animate
				properties:
					opacity: 1
					y: notForMeText2.originalFrame.y
				time: phraseAnimationTime
			storedPhrase2 = notForMeText2	

	
itWasOkay = ->
	#fade out the stored symbol and fade in selected symbol
	fadeOutStoredSymbol = storedSymbol.animate
		properties:
			opacity: 0
			rotationZ: 90
			scale: .6
		time: symbolAnimationTime	
	fadeOutStoredSymbol.on 'end', ->
		storedSymbol.rotationZ = startingSymbolRotation
		okay.animate
			properties:
				opacity: 1
				rotationZ: 0
				scale: 1
			time: symbolAnimationTime
		storedSymbol = okay
	#fade out stored phrase and fade in selected phrase
	utils.delay .2, ->
		fadeOutStoredPhrase = storedPhrase.animate
			properties:
				opacity: 0
				y: storedPhrase.originalFrame.y - ratingPhraseMove
			time: phraseAnimationTime	
		fadeOutStoredPhrase.on 'end', ->
			itWasOkayText.animate
				properties:
					opacity: 1
					y: itWasOkayText.originalFrame.y
				time: phraseAnimationTime
			storedPhrase = itWasOkayText
	utils.delay 1.5, ->
		wineCell.animate
			properties:
				x: wineCell.originalFrame.x - 640
			time: filtersTime
			curve: 'bezier-curve'
		isAnUnratedWine = false


itWasOkay2 = ->
	#fade out the stored symbol and fade in selected symbol
	fadeOutStoredSymbol = storedSymbol2.animate
		properties:
			opacity: 0
			rotationZ: 90
			scale: .6
		time: symbolAnimationTime
	fadeOutStoredSymbol.on 'end', ->
		storedSymbol2.rotationZ = startingSymbolRotation
		okay2.animate
			properties:
				opacity: 1
				rotationZ: 0
				scale: 1
			time: symbolAnimationTime
		storedSymbol2 = okay2
	#fade out stored phrase and fade in selected phrase
	utils.delay .2, ->
		fadeOutStoredPhrase2 = storedPhrase2.animate
			properties:
				opacity: 0
				y: storedPhrase2.originalFrame.y - ratingPhraseMove
			time: phraseAnimationTime	
		fadeOutStoredPhrase2.on 'end', ->
			itWasOkayText2.animate
				properties:
					opacity: 1
					y: itWasOkayText2.originalFrame.y
				time: phraseAnimationTime
			storedPhrase2 = itWasOkayText2
			
			
iLovedIt = ->
	#fade out the stored symbol and fade in selected symbol
	fadeOutStoredSymbol = storedSymbol.animate
		properties:
			opacity: 0
			rotationZ: 90
			scale: .6
		time: symbolAnimationTime	
	fadeOutStoredSymbol.on 'end', ->
		storedSymbol.rotationZ = startingSymbolRotation
		heart.animate
			properties:
				opacity: 1
				rotationZ: 0
				scale: 1
			time: symbolAnimationTime
		storedSymbol = heart
	#fade out stored phrase and fade in selected phrase
	utils.delay .2, ->
		fadeOutStoredPhrase = storedPhrase.animate
			properties:
				opacity: 0
				y: storedPhrase.originalFrame.y - ratingPhraseMove
			time: phraseAnimationTime	
		fadeOutStoredPhrase.on 'end', ->
			iLovedItText.animate
				properties:
					opacity: 1
					y: iLovedItText.originalFrame.y
				time: phraseAnimationTime
			storedPhrase = iLovedItText
	utils.delay 1.5, ->
		wineCell.animate
			properties:
				x: wineCell.originalFrame.x - 640
			time: filtersTime
			curve: 'bezier-curve'
		isAnUnratedWine = false

			
iLovedIt2 = ->
	#fade out the stored symbol and fade in selected symbol
	fadeOutStoredSymbol = storedSymbol2.animate
		properties:
			opacity: 0
			rotationZ: 90
			scale: .6
		time: symbolAnimationTime
	fadeOutStoredSymbol.on 'end', ->
		storedSymbol2.rotationZ = startingSymbolRotation
		heart2.animate
			properties:
				opacity: 1
				rotationZ: 0
				scale: 1
			time: symbolAnimationTime
		storedSymbol2 = heart2
	#fade out stored phrase and fade in selected phrase
	utils.delay .2, ->
		fadeOutStoredPhrase = storedPhrase2.animate
			properties:
				opacity: 0
				y: storedPhrase2.originalFrame.y - ratingPhraseMove
			time: phraseAnimationTime	
		fadeOutStoredPhrase.on 'end', ->
			iLovedItText2.animate
				properties:
					opacity: 1
					y: iLovedItText2.originalFrame.y
				time: phraseAnimationTime
			storedPhrase2 = iLovedItText2
	
			
regionNotification = ->
	regionUnlocked.opacity = 1
	myWinesScreen.animate
		properties:
			y: 0
		time: .4
		curve: 'bezier-curve'
	invite.animate
		properties:
			y: invite.originalFrame.y - notificationHeight
		time: .4
	utils.delay 4.4, ->
		if checkoutActive then regionUnlocked.opacity = 0
		else closeRegionUnlocked = myWinesScreen.animate
			properties:
				y: - notificationHeight
			time: .4
			curve: 'bezier-curve'
		closeRegionUnlocked.on 'end', ->
			regionUnlocked.animate
				properties:
					opacity: 0
				time: .1
			invite.animate
				properties:
					y: invite.originalFrame.y
				time:.4		
		
			
# Opening the rate menu
openRateMenu = ->
	rateMenu.bringToFront()
	rateMenu.y = 4
	rateMenu.animate
		properties:
			opacity: 1
		time: .1


cancelRateMenu = ->
	rateMenuExit = rateMenu.animate
		properties:
			opacity: 0
		time: .1
	rateMenuExit.on 'end', ->
		rateMenu.y = offBottomY


# Opening the rate menu
openRateMenu2 = ->
	rateMenu2.bringToFront()
	rateMenu2.y = 4
	rateMenu2.animate
		properties:
			opacity: 1
		time: .1


cancelRateMenu2 = ->
	rateMenuExit2 = rateMenu2.animate
		properties:
			opacity: 0
		time: .1
	rateMenuExit2.on 'end', ->
		rateMenu2.y = offBottomY

	
# Shipment opening and closing.		
openShipment = ->
	buttonActive = false
	nextShipmentSelected.opacity = 1
	nextShipment.opacity = 0	
	myWines.opacity = 1
	myWinesSelected.opacity = 0
	nextShipmentScreen.bringToFront()
	if checkoutActive then nextShipmentScreen.animate
		properties: 
			y: 0
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity
	else nextShipmentScreen.animate
		properties: 
			y: - notificationHeight
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity	
	myWinesScreen.animate
		properties:
			y: offBottomY
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity
	chuteIntro()


minimizeShipment = ->
	buttonActive = true
	nextShipmentScreen.animate
		properties: 
			y: minimizedScreenY - notificationHeight
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity
	myWinesScreen.y = offBottomY
	trail.y = trailHiddenY
	daysLeft.opacity = 0
	daysLeft.scale = daysLeftStartScale
			
			
# MyWines opening and closing.
openMyWines = ->
	buttonActive = false	
	nextShipmentSelected.opacity = 0
	nextShipment.opacity = 1
	myWines.opacity = 0
	myWinesSelected.opacity = 1
	nextShipmentScreen.y = offBottomY
	myWinesScreen.bringToFront()
	if checkoutActive then myWinesScreen.animate
		properties: 
			y: 0
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity
	else myWinesScreen.animate
		properties: 
			y: - notificationHeight
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity	
	
			
minimizeMyWines = ->
	buttonActive = true
	myWinesScreen.animate
		properties:
			y: minimizedScreenY - notificationHeight
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity
	myWinesScreen.animate
		properties:
			y: minimizedScreenY - notificationHeight
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity


openShipmentDetails = ->
	shipmentDetails.bringToFront()
	myWinesScreen.y = offBottomY
	if checkoutActive then scrollVeil2.opacity = 1
	shipmentDetails.animate
		properties:
			x: shipmentDetails.originalFrame.x
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity


closeShipmentDetails = ->
	shipmentDetails.animate
		properties:
			x: 640
		time: navTime
		curve: navCurve
		curveOptions:
			tension: navTension
			friction: navFriction
			velocity: navVelocity
		
			
# Swinging the Parachute Box
swing = ->
	boxAnimation = chuteBox.animate
		properties: 
			rotationZ: 4 * direction
		time: 3
		curve: "bezier-curve"
		curveOptions: "ease-in-out"		
	boxAnimation.on "end", ->
		repeat()
		
		
repeat = ->
	direction *= -1
	swing()	
	
	
repeat()


chuteIntro = ->
	trailMove = -> 
		trailAnimation = trail.animate
			properties:
				y: 48
			curve: 'cubic-bezier'	
			time: 1.6
		trailAnimation.on 'end', ->
			daysLeft.animate
				properties:
					scale: 1
					opacity: 1
				curve: 'spring'
				curveOptions:
					tension: 100
					friction: 19
				time: .3
	utils.delay(1.3, trailMove)


chuteIntro()

						


