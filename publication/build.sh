{
  "builds": [
    {
      "src": "publication/wsgi.py",
      "use": "@vercel/python",
      "config": { "maxLambdaSize": "15mb", "runtime": "python3.9" }
    },
    {
      "src": "build.sh",
      "use": "@vercel/static-build",
      "config": { "distDir": "staticfiles" }
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "publication/wsgi.py"
    },
    {
      "src": "/static/(.*)",
      "dest": "/static/$1"
    }
  ]
}