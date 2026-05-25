from fastapi import APIRouter, HTTPException

from app.schemas.medical import (
    SymptomRequest,
    SymptomResponse
)

from app.services.llm_service import analyze_symptoms

router = APIRouter()


@router.post(
    "/analyze",
    response_model=SymptomResponse
)
def analyze(data: SymptomRequest):

    try:
        result = analyze_symptoms(data.symptoms)

        return SymptomResponse(
            success=True,
            response=result
        )

    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=str(e)
        )