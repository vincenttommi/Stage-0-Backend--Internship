# HNG12 Public API

This is a simple public API built using Django Rest Framework (DRF). The API provides the following information in JSON format:

- My registered email address (used to register on the HNG12 Slack workspace)
- The current date and time in ISO 8601 format (UTC)
- The GitHub URL of the project's codebase

## Features

- **RESTful API**: Built using Django Rest Framework.
- **CORS Handling**: Supports Cross-Origin Resource Sharing (CORS).
- **JSON Response**: All responses are formatted as JSON.
- **Deployed Online**: The API is hosted and publicly accessible.

## API Specification

### **Endpoint:**
```plaintext
GET / http://127.0.0.1:8000/core/publication/
```

### **Response Format (200 OK)**
```json
HTTP 200 OK
Allow: GET, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "email": "vincenttommikorir@gmail.com",
    "current_datetime": "2025-01-30T13:25:13.466524+00:00",
    "github_url": "https://github.com/vincenttommi/Stage-0-Backend--Internship"
}
```

## Getting Started

### **1. Clone the Repository**
```bash
git clone https://github.com/vincenttommi/Stage-0-Backend--Internship
cd  Stage-0-Backend--Internship
```

### **2.  Activate  Virtual Environment**
```bash
python -m venv enviroment
source enviroment/bin/activate  
```

### **3. Install Dependencies**
```bash
pip install django djangorestframework django-cors-headers
```

### **4. Configure the Django Project**
Run the following command to start a new Django project:
```
django-admin startproject publication.
cd publication
```
Then, start a new Django app:
```
django-admin startapp core
```

### **5. Update `settings.py`**
Modify `config/settings.py` to include necessary apps and CORS settings:
```
INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "rest_framework",
    "corsheaders",
    "core",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "corsheaders.middleware.CorsMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.middleware.auth.AuthenticationMiddleware",
    "django.middleware.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

CORS_ALLOWED_ORIGINS = ["*"]  # Allow all origins for testing
TIME_ZONE = "UTC"
USE_TZ = True
```

### **6. Creating the API View**
Edit `core/views.py`:
```
from django.utils.timezone import now
from rest_framework.response import Response
from rest_framework.views import APIView

class PublicationAPI(APIView):
    def get(self, request):  
        return Response({
            "email": "vincenttommikorir@gmail.com",
            "current_datetime": now().isoformat(), 
            "github_url": "https://github.com/vincenttommi/Stage-0-Backend--Internship"
        })

```

### **7. Set Up URLs**
Edit `core/urls.py`:
``
from django.urls import path
from .views import PublicationAPI  

urlpatterns = [
    path("publication/", PublicationAPI.as_view(), name="publication-api"),
]
```
Include it in `publication/urls.py`:
```
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('core/', include('core.urls'))
]

```

### **8. Run the Server Locally**
```
python3 manage.py runserver
```
Access the API at:
```
http://127.0.0.1:8000/
```

## Deployment

### **2. Deploy on Render (Alternative Method)**
1. Go to [Render.com](https://render.com/)
2. Create a new **Web Service**
3. Connect your GitHub repository
4. Set runtime to `python3 manage.py runserver 0.0.0.0:8000`
5. Deploy

## Testing the API
Use **Postman** or **cURL**:
```bash
curl -X GET https://your-deployed-url.com/
```
Expected Response:
```json
{
  "email": "your-email@example.com",
  "current_datetime": "2025-01-30T09:30:00Z",
  "github_url": "https://github.com/yourusername/your-repo"
}
```

## License
This project is open-source under the MIT License.

## Author
[Vincent Tommi](https://github.com/vincenttommi?tab=repositories)

