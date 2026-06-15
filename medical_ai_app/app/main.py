from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.routes.medical import router as medical_router


app = FastAPI(
    title="AI Medical Assistant API",
    version="1.0.0"
)


# CORS

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Change later in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)




app.include_router(
    medical_router,
    prefix="/api/v1/medical",
    tags=["Medical AI"]
)




@app.get("/")
def root():
    return {
        "message": "AI Medical Assistant API Running"
    }


#  python -m uvicorn app.main:app --reload