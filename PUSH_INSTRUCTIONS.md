# How to Push to GitHub - mtghulame28-rgb/Fallguard

## Quick Steps

### Method 1: Using Command Line (If you have GitHub credentials)

1. **Open PowerShell in this folder:**
   - Right-click on `cloud_deploy` folder
   - Select "Open in Terminal" or "Open PowerShell window here"

2. **Run these commands:**
   ```bash
   git push origin main
   ```

3. **Enter credentials when prompted:**
   - Username: mtghulame28-rgb
   - Password: Your GitHub password or Personal Access Token

---

### Method 2: Using GitHub Desktop (Easiest)

1. **Download GitHub Desktop:**
   - https://desktop.github.com

2. **Login with your account:**
   - File → Options → Accounts → Sign in

3. **Add this repository:**
   - File → Add Local Repository
   - Choose: `C:\Users\Sameer\Downloads\50hz\50hz\cloud_deploy`

4. **Push to GitHub:**
   - Click "Push origin" button

---

### Method 3: Create Personal Access Token

1. **Generate Token:**
   - Go to: https://github.com/settings/tokens
   - Click "Generate new token (classic)"
   - Check "repo" scope
   - Generate and copy token

2. **Push with token:**
   ```bash
   git push https://YOUR_TOKEN@github.com/mtghulame28-rgb/Fallguard.git main
   ```

Replace `YOUR_TOKEN` with the actual token.

---

## After Pushing to GitHub

### Deploy on Railway:

1. **Go to Railway:**
   - https://railway.app

2. **Create New Project:**
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose: `mtghulame28-rgb/Fallguard`

3. **Railway will auto-deploy!**
   - Build time: ~3-5 minutes
   - You'll get a new URL like: `https://fallguard-production-xxxx.up.railway.app`

4. **Set Environment Variables:**
   - Click your project → Variables tab
   - Add these:
     ```
     TWILIO_SID=ACxxxxxxxxxxxxx
     TWILIO_TOKEN=your_token
     TWILIO_FROM=+1234567890
     EMERGENCY_TO=+1234567890
     PORT=5000
     ```

5. **Get Your New URL:**
   - Settings → Domains
   - Copy the Railway URL

6. **Update Mobile App:**
   - Edit `mobile_app/main.py`
   - Change: `CLOUD_URL = 'https://your-new-railway-url.up.railway.app'`

---

## Files Ready to Deploy:

✅ flask_api.py - Main API server
✅ simple_detector.pkl - ML model (97.98% accuracy)
✅ simple_fall_detector.py - Model class
✅ requirements.txt - Dependencies
✅ Procfile - Server config
✅ railway.json - Railway config
✅ .gitignore - Exclude unnecessary files

Everything is ready! Just push and deploy on Railway.
