extends Control

#class definition for a purchasable item
class Collectible:
	var name: String
	var price: int
	var quantity: int
	var icon: Texture
	

#market items for sale
var market_items = [
	Collectible.new("Researcher", 100, 5, "res://Game Assets/research.png"),
	Collectible.new("Soldier", 25, 20, "res://Game Assets/soldier.png"),
	Collectible.new("Airplane", 100, 5, "res://Game Assets/jet.png")
]

func _ready():
	for item in market_items:
		generateItem(item)

func generateItem(item):
	var itemContainer = HBoxContainer.new()
	var nameLabel = Label.new()
	var priceLabel = Label.new()
	var quantityLabel = Label.new()
	var icon = Sprite.new()
	var purchaseButton = Button.new()

	nameLabel.text = item.name
	priceLabel.text = "Price: " + str(item.price)
	quantityLabel.text = "Quantity: " + str(item.quantity)
	icon.texture = load(item.icon)
	purchaseButton.text = "Buy"
	purchaseButton.connect("pressed", self, "onPurchaseButtonPressed", [item])

	itemContainer.add_child(icon)
	itemContainer.add_child(nameLabel)
	itemContainer.add_child(priceLabel)
	itemContainer.add_child(quantityLabel)
	itemContainer.add_child(purchaseButton)
	
	add_child(itemContainer)
	
func onPurchaseButtonPressed(item):
	if item.quantity > 0 and player_money >= item.price:
		item.quantity -= 1
		player_money -= item.price
		# Emit signals here for inventory and money updates
		print("Item purchased: " + item.name)
	else:
		print("Cannot purchase item: " + item.name)

