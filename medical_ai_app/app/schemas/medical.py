from pydantic import BaseModel


class SymptomRequest(BaseModel):
    symptoms: str


class SymptomResponse(BaseModel):
    success: bool
    response: str