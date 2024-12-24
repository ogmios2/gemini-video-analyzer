from pydantic_settings import BaseSettings
from pydantic import Field

class Settings(BaseSettings):
    API_V1_STR: str = Field(default="/api/v1")
    SECRET_KEY: str = Field(default="your_secret_key")
    DEBUG: bool = Field(default=False)
    SERVER_BASE_PATH: str = Field(default='/EXAMPLE_SERVER')
    DATABASE_FILE: str = Field(default='database/items.json')

    class Config:
        env_file = ".env"

settings = Settings()
