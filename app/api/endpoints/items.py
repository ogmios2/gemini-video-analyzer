from fastapi import APIRouter, HTTPException
from app.models.item import Item
from app.db.json_db import get_items, add_item

router = APIRouter()

@router.get("/")
def read_items():
    return get_items()

@router.post("/")
def create_item(item: Item):
    return add_item(item)

@router.get("/{item_id}")
def read_item(item_id: int):
    items = get_items()
    if item_id < 0 or item_id >= len(items):
        raise HTTPException(status_code=404, detail="Item not found")
    return items[item_id]
