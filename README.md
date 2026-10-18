# E-Commerce Microservices Application

A full-stack MERN e-commerce application built with microservices architecture, featuring 4 separate Node.js backend services and a React frontend.

## 🏗️ Architecture Overview

This application demonstrates modern microservices architecture with the following components:

```
Frontend (React) → API Gateway → Microservices
                                    ├── User Service (3001)
                                    ├── Product Service (3002)
                                    ├── Cart Service (3003)
                                    └── Order Service (3004)
```

## 🔧 Technology Stack

### Backend
- **Runtime**: Node.js with Express.js
- **Database**: MongoDB with Mongoose ODM
- **Authentication**: JWT tokens
- **Architecture**: RESTful APIs with microservices

### Frontend
- **Framework**: React 18
- **Routing**: React Router
- **State Management**: React Query + Context API
- **HTTP Client**: Axios
- **Styling**: CSS3 with responsive design

## 📦 Microservices

### 1. User Service (Port 3001)
- User registration and authentication
- Profile management
- JWT token generation and validation
- User data persistence

**Endpoints:**
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User authentication
- `GET /api/auth/me` - Get current user
- `GET /api/users/profile` - Get user profile
- `PUT /api/users/profile` - Update user profile

### 2. Product Service (Port 3002)
- Product catalog management
- Category management
- Product search and filtering
- Inventory tracking

**Endpoints:**
- `GET /api/products` - Get products with filtering/pagination
- `GET /api/products/:id` - Get single product
- `POST /api/products` - Create product (admin)
- `PUT /api/products/:id` - Update product (admin)
- `DELETE /api/products/:id` - Soft delete product (admin)
- `GET /api/categories` - Get all categories
- `POST /api/categories` - Create category (admin)

### 3. Cart Service (Port 3003)
- Shopping cart management
- Add/remove/update cart items
- Cart validation
- Integration with Product Service

**Endpoints:**
- `GET /api/cart/:userId` - Get user's cart
- `POST /api/cart/:userId/items` - Add item to cart
- `PUT /api/cart/:userId/items/:productId` - Update cart item
- `DELETE /api/cart/:userId/items/:productId` - Remove cart item
- `DELETE /api/cart/:userId` - Clear entire cart
- `POST /api/cart/:userId/validate` - Validate cart items

### 4. Order Service (Port 3004)
- Order creation and management
- Payment processing simulation
- Order status tracking
- Integration with Cart and Product Services

**Endpoints:**
- `GET /api/orders/user/:userId` - Get user's orders
- `GET /api/orders/:id` - Get single order
- `POST /api/orders` - Create new order
- `PUT /api/orders/:id/status` - Update order status
- `DELETE /api/orders/:id` - Cancel order
- `POST /api/payments/process` - Process payment
- `POST /api/payments/refund` - Process refund

## 🚀 Getting Started

### Prerequisites
- Node.js 16+ and npm
- MongoDB (local or cloud instance)

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd ecommerce-microservices
```

2. **Install dependencies for each service**
```bash

# Install User Service dependencies
cd backend/user-service && npm install

# Install Product Service dependencies
cd ../product-service && npm install

# Install Cart Service dependencies
cd ../cart-service && npm install

# Install Order Service dependencies
cd ../order-service && npm install

# Install Frontend dependencies
cd ../../frontend && npm install
```

3. **Set up environment variables**

Create `.env` files in each service directory:

**backend/user-service/.env:**
```env
PORT=3001
MONGODB_URI=mongodb://localhost:27017/ecommerce_users
JWT_SECRET=your-jwt-secret-key
```

**backend/product-service/.env:**
```env
PORT=3002
MONGODB_URI=mongodb://localhost:27017/ecommerce_products
```

**backend/cart-service/.env:**
```env
PORT=3003
MONGODB_URI=mongodb://localhost:27017/ecommerce_carts
PRODUCT_SERVICE_URL=http://localhost:3002
```

**backend/order-service/.env:**
```env
PORT=3004
MONGODB_URI=mongodb://localhost:27017/ecommerce_orders
CART_SERVICE_URL=http://localhost:3003
PRODUCT_SERVICE_URL=http://localhost:3002
USER_SERVICE_URL=http://localhost:3001
```

**frontend/.env:**
```env
REACT_APP_USER_SERVICE_URL=http://localhost:3001
REACT_APP_PRODUCT_SERVICE_URL=http://localhost:3002
REACT_APP_CART_SERVICE_URL=http://localhost:3003
REACT_APP_ORDER_SERVICE_URL=http://localhost:3004
```

### Running the Application


** Run services individually**

Terminal 1 - User Service:
```bash
cd backend/user-service && npm start
```

Terminal 2 - Product Service:
```bash
cd backend/product-service && npm start
```

Terminal 3 - Cart Service:
```bash
cd backend/cart-service && npm start
```

Terminal 4 - Order Service:
```bash
cd backend/order-service && npm start
```

Terminal 5 - Frontend:
```bash
cd frontend && npm start
```

The application will be available at:
- Frontend: http://localhost:3000
- User Service: http://localhost:3001
- Product Service: http://localhost:3002
- Cart Service: http://localhost:3003
- Order Service: http://localhost:3004

## 🎯 Features

### User Features
- **Authentication**: Register and login with JWT tokens
- **Product Browsing**: View products with search, filtering, and pagination
- **Shopping Cart**: Add, update, and remove items
- **Checkout Process**: Complete order placement with shipping and payment
- **Order Management**: View order history and track status
- **Profile Management**: Update personal information and addresses

### Admin Features (Future Enhancement)
- Product and category management
- Order status updates
- Inventory management
- User management

### Technical Features
- **Microservices Architecture**: Loosely coupled services
- **RESTful APIs**: Standard HTTP methods and status codes
- **Data Validation**: Input validation and error handling
- **Cross-Service Communication**: HTTP-based service interactions
- **Responsive Design**: Mobile-friendly user interface
- **Error Handling**: Comprehensive error management
- **Loading States**: User-friendly loading indicators

## 📁 Project Structure

```
ecommerce-microservices/
├── backend/
│   ├── user-service/
│   │   ├── models/
│   │   ├── routes/
│   │   ├── middleware/
│   │   ├── server.js
│   │   └── package.json
│   ├── product-service/
│   │   ├── models/
│   │   ├── routes/
│   │   ├── server.js
│   │   └── package.json
│   ├── cart-service/
│   │   ├── models/
│   │   ├── routes/
│   │   ├── server.js
│   │   └── package.json
│   └── order-service/
│       ├── models/
│       ├── routes/
│       ├── server.js
│       └── package.json
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── contexts/
│   │   ├── pages/
│   │   ├── services/
│   │   ├── App.js
│   │   └── index.js
│   └── package.json
├── package.json
└── README.md
```

## 🔧 API Testing

You can test the APIs using tools like Postman or curl:

```bash
# Health check for all services
curl http://localhost:3001/health
curl http://localhost:3002/health
curl http://localhost:3003/health
curl http://localhost:3004/health

# Register a new user
curl -X POST http://localhost:3001/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"firstName":"John","lastName":"Doe","email":"john@example.com","password":"password123"}'

# Get products
curl http://localhost:3002/api/products

# Get categories
curl http://localhost:3002/api/categories
```

## 🚀 Deployment

### Production Considerations

1. **Environment Variables**: Use proper environment variable management
2. **Database**: Use MongoDB Atlas or other managed database services
3. **Process Management**: Use PM2 or similar for process management
4. **Load Balancing**: Implement load balancing for high availability
5. **Monitoring**: Add logging and monitoring solutions
6. **Security**: Implement rate limiting, CORS, and other security measures

### Docker Deployment

The project includes Dockerfiles for all four backend microservices and the React frontend. The frontend is served through Nginx, which proxies API requests to the appropriate backend containers.

#### Docker Components

| Component | Container port |
|---|---:|
| User Service | 3001 |
| Product Service | 3002 |
| Cart Service | 3003 |
| Order Service | 3004 |
| Frontend (Nginx) | 80 |

#### Build the Images

Run the following commands from the repository root. Each command uses the corresponding service directory as its Docker build context.

```powershell
docker build -t ecommerce-user-service:local ./backend/user-service
docker build -t ecommerce-product-service:local ./backend/product-service
docker build -t ecommerce-cart-service:local ./backend/cart-service
docker build -t ecommerce-order-service:local ./backend/order-service
docker build -t ecommerce-frontend:local ./frontend
```

#### Container Networking

The frontend Nginx configuration routes requests under `/api/auth` and `/api/users` to the user service, `/api/products` and `/api/categories` to the product service, `/api/cart` to the cart service, and `/api/orders` and `/api/payments` to the order service.

docker network create ecommerce-test-network

docker run -d --name ecommerce-user --network ecommerce-test-network -p 3001:3001 ecommerce-user-service:local
docker run -d --name ecommerce-product --network ecommerce-test-network -p 3002:3002 ecommerce-product-service:local
docker run -d --name ecommerce-cart --network ecommerce-test-network -p 3003:3003 ecommerce-cart-service:local
docker run -d --name ecommerce-order --network ecommerce-test-network -p 3004:3004 ecommerce-order-service:local
docker run -d --name ecommerce-frontend --network ecommerce-test-network -p 8088:80 ecommerce-frontend:local

For this routing to work, the containers must be connected to a Docker network and use the service names configured in `frontend/nginx/default.conf`.

The Dockerfiles and Nginx configuration are included in the repository. A Docker Compose configuration is not currently included.

#### Terraform Deployment Configuration

The `terraform/` directory contains Terraform configuration for an optional AWS deployment in the Mumbai region (`ap-south-1`). The configuration describes a VPC, public subnet, security group, and EC2 instance.

**Important:** Terraform deployment is optional and can incur AWS charges. Review the configuration and costs before deploying. Do not commit Terraform state files, state backups, credentials, or secret variable files.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 🆘 Support

For support and questions:
- Check the documentation
- Review API endpoints and expected payloads
- Ensure all services are running
- Verify database connections
- Check environment variables

## 🔮 Future Enhancements

- **API Gateway**: Centralized request routing and authentication
- **Docker Containerization**: Full containerization with docker-compose
- **Message Queues**: Async communication between services
- **Caching**: Redis caching for improved performance
- **Search Engine**: Elasticsearch for advanced product search
- **File Upload**: Image upload and management
- **Email Service**: Order confirmations and notifications
- **Admin Dashboard**: Administrative interface
- **Analytics**: Order and user analytics
- **Payment Integration**: Real payment gateway integration


## Docker Deployment

The E-Commerce Store application has been enhanced with Docker containerization to support running the frontend and backend microservices independently.

### Dockerized Services

The following Docker containers have been configured:

| Service | Docker Container | Port |
|---|---|---|
| Frontend | `ecommerce-frontend` | `8088:80` |
| User Service | `ecommerce-user` | `3001:3001` |
| Product Service | `ecommerce-product` | `3002:3002` |
| Cart Service | `ecommerce-cart` | `3003:3003` |
| Order Service | `ecommerce-order` | `3004:3004` |

All five application containers are connected to the `ecommerce-test-network` Docker network, enabling communication between the frontend and backend services.

<img width="1365" height="624" alt="Screenshot 2026-10-17 202553" src="https://github.com/user-attachments/assets/97e11a0c-ef80-429d-b669-3b6ce31a0a32" />


### Technologies Used

- Docker
- Node.js
- Nginx
- React
- Terraform
- AWS EC2 configuration
- Git and GitHub

### Dockerfiles and .dockerignore

Dockerfiles have been added for all four backend services and the frontend.

The backend Dockerfiles use `node:20-alpine` as the base image and install production dependencies before starting their respective Node.js applications.

The frontend uses a multi-stage Docker build:
1. Builds the React application using Node.js.
2. Copies the production build into an Nginx container.
3. Serves the frontend using Nginx on port 80.

Separate `.dockerignore` files have been added to exclude unnecessary files such as `node_modules`, environment files, build artifacts, Git metadata, and log files from Docker build contexts.

### Nginx Reverse Proxy Configuration

The file `frontend/nginx/default.conf` configures Nginx to serve the React frontend and route API requests to the appropriate backend containers.

| API Route | Target Service |
|---|---|
| `/api/auth` | User Service |
| `/api/users` | User Service |
| `/api/products` | Product Service |
| `/api/categories` | Product Service |
| `/api/cart` | Cart Service |
| `/api/orders` | Order Service |
| `/api/payments` | Order Service |

The frontend uses relative API URLs, allowing requests to pass through the Nginx reverse proxy rather than relying on hard-coded localhost ports.

### Running the Application

The following commands build the Docker images from the project root directory in PowerShell:

```powershell
docker build -t ecommerce-user-service:local ./backend/user-service
docker build -t ecommerce-product-service:local ./backend/product-service
docker build -t ecommerce-cart-service:local ./backend/cart-service
docker build -t ecommerce-order-service:local ./backend/order-service
docker build -t ecommerce-frontend:local ./frontend
