from app import app

def test_root_returns_hola_mundo():
    client = app.test_client()
    resp = client.get("/")
    assert resp.status_code == 200
    assert resp.get_json()["message"] == "Hola Mundo"