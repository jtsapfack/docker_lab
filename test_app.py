import pytest
from app import app

def test_index():
	tester=app.test_client().get('/')
    assert tester.status_code==200
    assert b"Hello, World!" in tester.data
	#response=tester.get('/')    
	#assert response.status_code==200
    #assert b"Hello, World!" in response.data
