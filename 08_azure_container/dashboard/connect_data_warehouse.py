from pathlib import Path 
import duckdb
import os

# DB_PATH = os.getenv("DUCKDB_PATH")
FILES_SHARE_PATH = Path("/mnt/datajobads/job_ads.duckdb")

def query_job_listings(query= "SELECT * FROM marts.mart_technical_jobs"):
    with duckdb.connect(FILES_SHARE_PATH, read_only= True) as conn:
        return conn.query(f"{query}").df()