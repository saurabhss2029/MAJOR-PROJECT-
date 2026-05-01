# MindCare AI - Child Mental Health Prediction System

## Project Overview
MindCare AI is an AI-powered web application designed to assess and predict children's mental health status. It combines machine learning with a beautiful, user-friendly interface to provide mental wellness insights and recommendations.

**Made by: Team PCS26-22**

## Features

### 🧠 AI Prediction
- Advanced machine learning model trained on real mental health data
- Analyzes 10 key factors for comprehensive assessment
- Provides probability scores for three mental health categories:
  - **Healthy**: Good mental health status
  - **Moderate**: Some concerns requiring attention
  - **At Risk**: Significant concerns requiring professional support

### 📊 Beautiful Dashboard
- Intuitive form interface for data input
- Real-time prediction with pie charts
- Probability breakdown visualization
- Color-coded results (Green/Yellow/Red)

### 📄 PDF Report Generation
- Download comprehensive assessment reports
- Includes predictions, probabilities, and recommendations
- Professional formatting with disclaimer

### 💬 AI Wellness Tips
- Powered by Google's Gemini AI
- Personalized mental health suggestions
- Evidence-based wellness recommendations

### 🎥 Video Consultation
- Connect with mental health professionals
- Video call interface with doctors
- Secure, confidential consultations

### ❓ FAQ Section
- Comprehensive Q&A about the application
- Information about the AI model
- Privacy and security details

## System Requirements

- **Python 3.8+**
- **Node.js 14+** (for npm)
- **Modern web browser** (Chrome, Firefox, Safari, Edge)

## Installation

### 1. Clone/Extract the Project
```bash
cd c:\Users\hp\Desktop\child_mental_health_full_project
```

### 2. Backend Setup
```bash
cd backend
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Frontend Setup
```bash
cd frontend
npm install
```

## Running the Application

### Start Backend (Terminal 1)
```bash
cd c:\Users\hp\Desktop\child_mental_health_full_project\backend
.venv\Scripts\activate
python -m uvicorn app.main:app --reload --port 8000
```

**Expected output:**
```
INFO:     Uvicorn running on http://0.0.0.0:8000
✓ Model loaded successfully
✓ Scaler loaded successfully
```

### Start Frontend (Terminal 2)
```bash
cd c:\Users\hp\Desktop\child_mental_health_full_project\frontend
npm start
```

**Expected output:**
```
Compiled successfully!
On Your Network: http://localhost:3001
```

### Access the Application
- Open browser to: `http://localhost:3001`
- Sign in with your Clerk account

## Usage Guide

### 1. Home Page
- Welcome screen with application overview
- Quick links to different features

### 2. Prediction Page
- Fill out the assessment form with 10 factors
- Click "Predict" to get instant results
- View results with:
  - Prediction status (Healthy/Moderate/At Risk)
  - Probability breakdown pie chart
  - Detailed probability percentages

### 3. Download Report
- Click "Download Report (PDF)" after prediction
- Get professional PDF with:
  - Assessment results
  - Probability analysis
  - Your input factors
  - Recommendations
  - Disclaimer

### 4. Tips Page
- Chat with AI wellness advisor
- Get personalized mental health tips
- Ask questions about wellness

### 5. FAQ Page
- Browse frequently asked questions
- Expand answers for more details
- Learn about the AI model

### 6. Help Page
- Connect with available doctors
- Start video consultation
- Get professional support

## Assessment Factors

The model analyzes these 10 factors:

| Factor | Range | Description |
|--------|-------|-------------|
| Age | 5-18 | Child's age in years |
| Gender | -1/0/1 | Male (-1), Female (0), Others (1) |
| Sleep Hours | 0-24 | Hours of sleep per day |
| Screen Time | 0-24 | Hours of screen usage per day |
| Physical Activity | 0-24 | Hours of physical activity per day |
| Stress Level | 1-5 | Stress rating (1=low, 5=high) |
| Academic Score | 0-100 | Academic performance score |
| Family Interaction | 1-5 | Family interaction quality (1=low, 5=high) |
| Nutrition Score | 1-5 | Nutrition quality (1=poor, 5=excellent) |
| Social Media Usage | 0-24 | Hours of social media per day |

## API Endpoints

### Prediction Endpoint
```
POST /predict
Content-Type: application/json

{
  "age": 15,
  "gender": 0,
  "sleep_hours": 8,
  "screen_time": 3,
  "physical_activity": 2,
  "stress_level": 3,
  "academic_score": 85,
  "family_interaction": 4,
  "nutrition_score": 4,
  "social_media_usage": 2.5
}

Response:
{
  "prediction": "Healthy",
  "description": "✓ Good mental health - Keep up the positive habits!",
  "probabilities": {
    "healthy": 78.5,
    "moderate": 15.2,
    "at_risk": 6.3
  }
}
```

### Health Check
```
GET /health

Response:
{
  "status": "ok",
  "model_loaded": true,
  "scaler_loaded": true,
  "classes": {0: "healthy", 1: "moderate", 2: "at_risk"}
}
```

### PDF Report
```
POST /generate-report
Content-Type: application/json

[Same request as /predict]

Response: PDF file (application/pdf)
```

## Training the Model

### Update with New Dataset
1. Place your CSV file at: `backend/data/dataset.csv`
2. Run transformation: `python transform_dataset.py`
3. Train model: `python train_model.py`
4. Restart backend

### Expected Dataset Format
```
age,gender,sleep_hours,screen_time,physical_activity,stress_level,academic_score,family_interaction,nutrition_score,social_media_usage,mental_health
15,0,8,3,2,3,85,4,4,2.5,healthy
```

## Troubleshooting

### Backend won't start
```bash
# Check if port 8000 is in use
netstat -ano | findstr :8000

# Kill process if needed
taskkill /PID <PID> /F
```

### Frontend won't load
```bash
# Clear cache and restart
rm -r frontend/node_modules
npm install
npm start
```

### Model not loaded
```bash
# Check model files exist
dir backend\data\

# Retrain if missing
python backend\train_model.py
```

### PDF download fails
- Check browser console for errors (F12)
- Ensure backend is running
- Check backend logs for issues

## Project Structure

```
child_mental_health_full_project/
├── backend/
│   ├── app/
│   │   └── main.py (API endpoints)
│   ├── data/
│   │   ├── dataset.csv
│   │   ├── mental_health_model.pkl
│   │   └── scaler.pkl
│   ├── train_model.py
│   ├── transform_dataset.py
│   └── requirements.txt
├── frontend/
│   ├── src/
│   │   ├── App.jsx (Main component)
│   │   ├── api.js (API calls)
│   │   ├── index.css (Styling)
│   │   └── pages/
│   │       ├── Tips.jsx
│   │       ├── FAQ.jsx
│   │       └── Help.jsx
│   └── package.json
└── README.md
```

## Performance Metrics

- **Model Accuracy**: ~85-90% (varies with dataset)
- **Prediction Time**: <100ms
- **PDF Generation**: <2 seconds
- **Video Call Latency**: <200ms

## Security Features

✅ CORS enabled for frontend communication
✅ Input validation on all endpoints
✅ Error handling with meaningful messages
✅ API key protection (Clerk authentication)
✅ HTTPS ready for production

## Privacy & Disclaimer

⚠️ **Important:**
- This tool is for assessment purposes only
- NOT a substitute for professional diagnosis
- Always consult qualified mental health professionals
- Data is processed securely
- No data is stored permanently

## Future Enhancements

- [ ] Mobile app version
- [ ] Multi-language support
- [ ] Real-time collaboration features
- [ ] Advanced analytics dashboard
- [ ] Integration with mental health professionals

## Support & Contact

For issues or questions:
- Check FAQ section in the app
- Review troubleshooting guide
- Contact your system administrator

## License

This project is developed for educational and research purposes.

---

**Made with ❤️ by Team PCS26-22**





