import json
from app.models.item import Item
from app.core.config import settings

def get_items():
    try:
        with open(settings.DATABASE_FILE, "r") as f:
            return json.load(f)
    except FileNotFoundError:
        return []

def save_items(items):
    with open(settings.DATABASE_FILE, "w") as f:
        json.dump(items, f, indent=2)

def add_item(item: Item):
    items = get_items()
    items.append(item.model_dump())
    save_items(items)
    return item
