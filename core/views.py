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
