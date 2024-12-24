# gemini-video-analyzer

This is a FastAPI project with a simple JSON file-based database.

## Setup

1. Create a virtual environment:
   ```
   python3 -m venv .venv
   ```

2. Activate the virtual environment:
   ```
   source .venv/bin/activate
   ```

3. Install the requirements:
   ```
   pip install -r requirements.txt
   ```

4. Run the server:
   ```
   uvicorn app.main:app --reload
   ```

5. Test the API:
   - GET all items: `curl http://localhost:8000/api/v1/items`
   - POST a new item: `curl -X POST -H "Content-Type: application/json" -d '{"name":"New Item","description":"A new item"}' http://localhost:8000/api/v1/items`
   - GET a specific item: `curl http://localhost:8000/api/v1/items/0`

## Project Structure

```
gemini-video-analyzer/
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── api/
│   │   ├── __init__.py
│   │   └── endpoints/
│   │       ├── __init__.py
│   │       └── items.py
│   ├── core/
│   │   ├── __init__.py
│   │   └── config.py
│   ├── db/
│   │   ├── __init__.py
│   │   └── json_db.py
│   └── models/
│       ├── __init__.py
│       └── item.py
├── database/
│   └── items.json
├── tests/
│   └── __init__.py
├── .env
├── .gitignore
├── requirements.txt
└── README.md
```
