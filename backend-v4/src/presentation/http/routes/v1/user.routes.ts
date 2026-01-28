import { Router } from 'express';
import { UserController } from '../../controllers/UserController';
import { authMiddleware } from '../../middlewares/auth.middleware';

const router = Router();
const userController = new UserController();

router.use(authMiddleware);

// Get all users
router.get('/', userController.getUsers.bind(userController));

// Get users by role
router.get('/by-role/:role', userController.getUsersByRole.bind(userController));

// Get user by ID
router.get('/:id', userController.getUserById.bind(userController));

// Create user
router.post('/', userController.createUser.bind(userController));

// Update user
router.put('/:id', userController.updateUser.bind(userController));

// Delete user
router.delete('/:id', userController.deleteUser.bind(userController));

// Toggle active status
router.patch('/:id/toggle-active', userController.toggleActiveStatus.bind(userController));

// Update credit limit
router.patch('/:id/credit-limit', userController.updateCreditLimit.bind(userController));

// Reset password
router.post('/:id/reset-password', userController.resetPassword.bind(userController));

export default router;