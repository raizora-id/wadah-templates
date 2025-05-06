from app.core.database import engine
from app.core.env import get_env
from app.core.logging import RequestIdMiddleware, logger
from app.router.openai import router as openai_router
from app.router.root import router as root_router
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

env = get_env()
app = FastAPI(
    title="Machine Learning API",
    description="Machine Learning API",
    version="0.1.0",
    docs_url="/docs",
    root_path=env.ML_PREFIX_API,
)
logger.debug(
    "Initializing Machine Learning app",
    extra={
        "docs_url": "/",
        "root_path": env.ML_PREFIX_API,
    },
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
app.add_middleware(RequestIdMiddleware)

app.include_router(root_router)
app.include_router(openai_router)


@app.on_event("shutdown")
def shutdown():
    logger.info("Application shutting down, preparing for graceful shutdown")
    logger.info("Disposing database connections")
    engine.dispose()
    logger.info("Database engine disposed")
