# 🚀 Hello Pulse Survey - Market Research & Analytics

A comprehensive data analytics platform for analyzing Hello Pulse brainstorming app survey data, featuring automated data pipelines, machine learning insights, and interactive dashboards.

## 📊 Project Overview

Hello Pulse Survey is a data-driven market research project that analyzes survey responses from 243 potential users to inform the go-to-market strategy for Hello Pulse - an AI-powered collaborative brainstorming platform.

### **Key Features:**
- 🤖 **AI-Powered Analytics** - Machine learning for user segmentation and prediction
- 📈 **Interactive Dashboards** - Real-time insights with Streamlit and Plotly
- ⚡ **Automated Data Pipelines** - Apache Airflow orchestration
- 🗄️ **Modern Data Stack** - PostgreSQL + dbt + UV package management
- 🐳 **Containerized Development** - Complete Docker-based environment

## 🛠️ Tech Stack

### **Core Technologies:**
- **Python 3.12** - Primary development language
- **UV** - Fast Python package manager (10-100x faster than pip)
- **PostgreSQL** - Primary database for analytics
- **Apache Airflow** - Workflow orchestration and scheduling
- **dbt** - Data transformation and modeling
- **Docker & Docker Compose** - Containerized development environment

### **Analytics & ML:**
- **pandas, numpy** - Data manipulation and analysis
- **scikit-learn** - Machine learning and user segmentation
- **matplotlib, seaborn, plotly** - Data visualization
- **streamlit** - Interactive web dashboards
- **jupyter** - Exploratory data analysis

### **Additional Tools:**
- **FastAPI** - API development (future features)
- **pytest** - Testing framework
- **Starship** - Enhanced terminal prompt

## 🚀 Quick Start

### **Prerequisites:**
- Docker and Docker Compose installed
- Make utility (for command shortcuts)
- Git for version control

### **1. Initial Setup:**
```bash
# Clone the repository
git clone <your-repo-url>
cd hello_pulse_survey

# Build the development environment
make build

# Start the workspace (PostgreSQL + development container)
make up

# Access the development container
make bash
```

### **2. Install Project Dependencies:**
```bash
# Inside the container, add core packages
uv add apache-airflow psycopg2-binary sqlalchemy dbt-core dbt-postgres
uv add streamlit plotly seaborn scikit-learn jupyter fastapi uvicorn

# Install the project in editable mode
uv pip install -e .
```

### **3. Start Airflow (Optional):**
```bash
# From host machine - start Airflow services
make airflow-init  # Run once to initialize
make airflow-up    # Start Airflow services

# Or start everything together
make full-up      # Workspace + Airflow
```

## 📁 Project Structure

```
hello_pulse_survey/
├── 📄 README.md                    # This file
├── 🐳 Dockerfile                   # UV-optimized Python environment
├── 🐳 docker-compose.yml           # Workspace + PostgreSQL
├── 🐳 docker-compose-airflow.yml   # Airflow orchestration stack
├── ⚙️ Makefile                     # Development commands
├── 📦 pyproject.toml               # Project dependencies and metadata
├── 🐍 main.py                      # Main application entry point
├── 📊 data/
│   ├── raw/                        # Raw survey CSV files
│   ├── processed/                  # Cleaned and transformed data
│   └── uploads/                    # User-uploaded data
├── 🔄 dags/                        # Airflow DAGs for data pipelines
├── 📈 dashboards/                  # Streamlit analytics dashboards
├── 🗄️ sql/                         # Database schemas and queries
├── 📋 notebooks/                   # Jupyter analysis notebooks
├── 🧪 tests/                       # Test suite
└── 📁 volumes/                     # Docker persistent storage
    ├── db_data/                    # PostgreSQL data
    └── logs/                       # Application logs
```

## 💻 Development Commands

### **Container Management:**
```bash
make build          # Build the development image
make up             # Start workspace containers
make down           # Stop workspace containers
make bash           # Open shell in development container
make logs           # View container logs
make status         # Show current Docker status
```

### **Airflow Operations:**
```bash
make airflow-init   # Initialize Airflow (run once)
make airflow-up     # Start Airflow services
make airflow-down   # Stop Airflow services
make airflow-bash   # Access Airflow scheduler shell
make airflow-logs   # View Airflow logs
```

### **Full Stack Operations:**
```bash
make full-up       # Start everything (workspace + Airflow)
make full-down     # Stop everything
make rebuild       # Clean rebuild from scratch
make clean         # 🧹 Remove everything (images, volumes, cache)
```

### **Package Management (Inside Container):**
```bash
uv add package-name        # Add new Python package
uv remove package-name     # Remove package
uv pip list               # List installed packages
uv sync                   # Sync dependencies from pyproject.toml
```

## 📊 Data Pipeline Architecture

### **1. Data Ingestion:**
- Raw survey CSV files stored in `data/raw/`
- Automated ingestion via Airflow DAGs
- Data validation and quality checks

### **2. Data Storage:**
- **PostgreSQL** primary database with schemas:
  - `raw` - Original survey responses
  - `staging` - Cleaned and normalized data
  - `analytics` - Business intelligence tables
  - `ml` - Machine learning features and results

### **3. Data Transformation:**
- **dbt models** for data transformation
- User segmentation and feature engineering
- Automated testing and documentation

### **4. Analytics & Insights:**
- **Streamlit dashboards** for interactive analysis
- **Jupyter notebooks** for deep-dive analysis
- **Machine learning models** for user segmentation

## 🎯 Key Survey Insights

Based on analysis of 243 survey responses:

### **Market Opportunity:**
- **68% haven't used brainstorming apps** - massive untapped market
- **56% prefer group collaboration** - validates collaborative focus
- **40% show high AI interest** - ready for AI-powered features

### **Target Demographics:**
- **47% senior professionals/executives** - primary enterprise market
- **26% students (18-25)** - early adopter segment
- **Average willingness to pay: €85** - strong monetization potential

### **Competitive Landscape:**
- **Miro**: 1.4/5 satisfaction (closest competitor)
- **Notion**: 2.1/5 satisfaction (documentation-focused)
- **Canva**: 3.1/5 satisfaction (different market segment)

## 🔬 Analytics Capabilities

### **User Segmentation:**
```python
# Example ML pipeline for user clustering
from sklearn.cluster import KMeans
import pandas as pd

# Segment users by AI interest, pricing, and demographics
user_segments = kmeans_clustering(survey_data)
```

### **Feature Priority Analysis:**
- AI-powered ideation: High priority (8.5/10)
- Real-time collaboration: High priority (8.2/10)
- Mobile accessibility: Medium priority (6.8/10)

### **Pricing Optimization:**
- **Enterprise tier**: €59/month (high AI interest + €50+ willingness)
- **Professional tier**: €29/month (medium engagement)
- **Freemium tier**: Free + €9/month (students + low budget)

## 🌐 Access Points

When services are running:

### **Development:**
- **Development Container**: `make bash`
- **Database**: `localhost:5432` (postgres/password)

### **Airflow:**
- **Web UI**: http://localhost:8080 (airflow/airflow)
- **API**: http://localhost:8080/api/v1/
- **Flower (Celery monitoring)**: http://localhost:5555

### **Analytics:**
- **Streamlit Dashboard**: http://localhost:8501
- **Jupyter Lab**: http://localhost:8888

## 🧪 Testing & Quality

```bash
# Run tests
pytest tests/

# Data quality tests with dbt
dbt test

# Code formatting
black .
isort .

# Type checking
mypy src/
```

## 🚢 Deployment

### **Development:**
Current setup optimized for local development and analysis.

### **Production Considerations:**
- Use production-grade PostgreSQL instance
- Deploy Airflow on Kubernetes or cloud service
- Implement proper secrets management
- Add monitoring and logging
- Set up CI/CD pipeline

## 🤝 Contributing

1. **Fork the repository**
2. **Create feature branch**: `git checkout -b feature/amazing-feature`
3. **Make changes** and add tests
4. **Run quality checks**: `make test`
5. **Commit changes**: `git commit -m 'Add amazing feature'`
6. **Push to branch**: `git push origin feature/amazing-feature`
7. **Open Pull Request**

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact & Support

**Project Maintainer:** Hassaelle ROUMBO  
**Email:** roumbohassaelle@outlook.fr  
**Project:** Hello Pulse Survey Analytics

### **Getting Help:**
- 📖 Check this README for common tasks
- 🐛 Open an issue for bugs or feature requests
- 💬 Use `make help` for available commands
- 🔍 Check logs with `make logs` or `make airflow-logs`

## 🎯 Next Steps

1. **Complete survey data analysis** with interactive dashboards
2. **Develop ML models** for user behavior prediction
3. **Create business intelligence reports** for stakeholders
4. **Build API endpoints** for real-time data access
5. **Implement automated reporting** pipeline

---

**Built with ❤️ for data-driven decision making in the Hello Pulse project**