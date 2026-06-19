# Railway Deployment Guide - Fall Detection API

**Current URL:** `https://web-production-44fc6.up.railway.app`

---

## 🚀 Quick Deploy/Update Steps

### Option A: Deploy from GitHub (Recommended)

1. **Create GitHub Repository for API:**
   ```bash
   cd c:\Users\Sameer\Downloads\50hz\50hz\cloud_deploy
   git init
   git add .
   git commit -m "Initial commit - Fall detection API"
   ```

2. **Create New GitHub Repo:**
   - Go to: https://github.com/new
   - Name: `fallguard-api`
   - Don't initialize with README
   - Click "Create repository"

3. **Push Code:**
   ```bash
   git remote add origin https://github.com/Sameer1234-prog/fallguard-api.git
   git branch -M main
   git push -u origin main
   ```

4. **Deploy on Railway:**
   - Go to: https://railway.app/dashboard
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose `fallguard-api`
   - Railway will auto-detect and deploy!

### Option B: Deploy from CLI

1. **Install Railway CLI:**
   ```bash
   npm install -g @railway/cli
   # OR
   curl -fsSL https://railway.app/install.sh | sh
   ```

2. **Login:**
   ```bash
   railway login
   ```

3. **Deploy:**
   ```bash
   cd c:\Users\Sameer\Downloads\50hz\50hz\cloud_deploy
   railway init
   railway up
   ```

### Option C: Update Existing Deployment

If you already have a Railway project:

1. **Link to existing project:**
   ```bash
   cd c:\Users\Sameer\Downloads\50hz\50hz\cloud_deploy
   railway link
   ```

2. **Deploy update:**
   ```bash
   railway up
   ```

---

## 🔐 Environment Variables (Required for SMS)

Set these in Railway Dashboard → Your Project → Variables:

```env
TWILIO_SID=ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
TWILIO_TOKEN=your_auth_token_here
TWILIO_FROM=+1234567890
EMERGENCY_TO=+1234567890
PORT=5000
```

### How to Get Twilio Credentials:

1. **Sign up:** https://www.twilio.com/try-twilio (Free trial)
2. **Get credentials:**
   - Go to Console Dashboard
   - Copy **Account SID** → `TWILIO_SID`
   - Copy **Auth Token** → `TWILIO_TOKEN`
3. **Get phone number:**
   - Click "Get a Trial Number"
   - Copy number → `TWILIO_FROM` (format: +1234567890)
4. **Add emergency contact:**
   - Your phone number → `EMERGENCY_TO` (format: +1234567890)
   - Must verify this number in Twilio for trial accounts

**Note:** Twilio free trial gives you $15 credit (~500 SMS messages)

---

## 📁 Required Files (Already in cloud_deploy folder)

```
cloud_deploy/
├── flask_api.py              ✅ Main API server
├── simple_detector.pkl       ✅ ML model
├── simple_fall_detector.py   ✅ Model class
├── requirements.txt          ✅ Python dependencies
├── Procfile                  ✅ Gunicorn config
├── railway.json              ✅ Railway config
└── .gitignore                ✅ Ignore build artifacts
```

All files are ready to deploy!

---

## 🧪 Test Your Deployment

### 1. Check if API is running:
```bash
curl https://web-production-44fc6.up.railway.app/ping
```

**Expected response:**
```json
{
  "status": "online",
  "model": "Gradient Boosting",
  "accuracy": 0.9798,
  "buffer": 0,
  "window_size": 125
}
```

### 2. Test SMS (after setting Twilio vars):
```bash
curl -X POST https://web-production-44fc6.up.railway.app/test_sms
```

### 3. Send sensor data:
```bash
curl -X POST https://web-production-44fc6.up.railway.app/data \
  -H "Content-Type: application/json" \
  -d '{"samples":[[100,200,300,10,20,30]]}'
```

### 4. Get result:
```bash
curl https://web-production-44fc6.up.railway.app/result
```

---

## 🔄 Update Existing Deployment

If you need to update the code:

### Method 1: Git Push (if using GitHub)
```bash
cd c:\Users\Sameer\Downloads\50hz\50hz\cloud_deploy
git add .
git commit -m "Update API"
git push origin main
```
Railway will auto-deploy when you push!

### Method 2: Railway CLI
```bash
cd c:\Users\Sameer\Downloads\50hz\50hz\cloud_deploy
railway up
```

---

## 📊 Monitor Your Deployment

### Railway Dashboard:
- **Logs:** See real-time server logs
- **Metrics:** CPU, Memory, Network usage
- **Deployments:** View deployment history
- **Variables:** Manage environment variables

### Access Dashboard:
1. Go to: https://railway.app/dashboard
2. Click your project
3. View logs, metrics, and settings

---

## 🌐 Get Your Railway URL

After deployment, Railway gives you a URL like:
```
https://your-project-name.up.railway.app
```

### Set Custom Domain (Optional):
1. Railway Dashboard → Settings → Domains
2. Add custom domain
3. Update DNS records
4. SSL certificate auto-generated

---

## 💰 Railway Pricing

- **Free Tier:**
  - $5 free credit/month
  - ~150 hours of runtime
  - Perfect for testing
  
- **Paid:**
  - $5/month minimum
  - Pay only for what you use
  - ~$5-10/month for this API

**Note:** Your current deployment at `web-production-44fc6.up.railway.app` is already running!

---

## 🐛 Troubleshooting

### Build Fails:
- Check `requirements.txt` has all dependencies
- Ensure `simple_detector.pkl` is included
- Check Railway logs for errors

### SMS Not Sending:
- Verify Twilio environment variables are set
- Check phone numbers have `+` prefix
- For trial accounts, verify recipient number in Twilio

### API Returns 503:
- Check Railway logs
- May need to increase resources
- Check if model file loaded successfully

### Can't Access URL:
- Wait 2-3 minutes after deployment
- Check Railway dashboard for deployment status
- Ensure no build errors in logs

---

## 🔗 Integration with Mobile App

Your mobile app is already configured to use:
```python
CLOUD_URL = 'https://web-production-44fc6.up.railway.app'
```

After updating API:
1. No changes needed in mobile app
2. App will automatically use updated API
3. Just rebuild mobile APK if you change app code

---

## 📝 API Endpoints Summary

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/ping` | GET | Health check |
| `/data` | POST | Send sensor data |
| `/result` | GET | Get latest prediction |
| `/history` | GET | Get fall history |
| `/reset` | POST | Clear buffer |
| `/settings` | GET/POST | Emergency contact |
| `/test_sms` | POST | Test SMS sending |

---

## ✅ Deployment Checklist

- [ ] Code pushed to GitHub
- [ ] Railway project created
- [ ] Deployment successful
- [ ] `/ping` endpoint returns 200
- [ ] Twilio variables configured
- [ ] Test SMS sent successfully
- [ ] Mobile app connects to API
- [ ] Fall detection working end-to-end

---

## 🆘 Need Help?

**Railway Support:**
- Discord: https://discord.gg/railway
- Docs: https://docs.railway.app

**Twilio Support:**
- Console: https://console.twilio.com
- Docs: https://www.twilio.com/docs

**Your Current Setup:**
- API URL: `https://web-production-44fc6.up.railway.app`
- Model: Gradient Boosting (97.98% accuracy)
- SMS: Configured via Twilio environment variables
