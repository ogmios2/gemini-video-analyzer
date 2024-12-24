from fastapi import FastAPI
from app.core.config import settings
from app.api.endpoints import router as api_router

app = FastAPI()

app.include_router(api_router, prefix=settings.API_V1_STR)

@app.get("/")
def read_root():
    return {"Hello": "World"}
