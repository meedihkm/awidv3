/**
 * Entry point with error handling
 * Wrapper pour capturer les erreurs d'import
 */

console.log('🎬 Starting index.ts...');

// Register path aliases FIRST
try {
    console.log('📦 Registering path aliases...');
    require('./bootstrap');
    console.log('✅ Path aliases registered successfully');
} catch (error) {
    console.error('❌ Failed to register path aliases:', error);
    process.exit(1);
}

// Import and start main application
console.log('📦 Importing main application...');
try {
    require('./main');
    console.log('✅ Main application imported successfully');
} catch (error) {
    console.error('❌ Failed to import main application:', error);
    if (error instanceof Error) {
        console.error('Error message:', error.message);
        console.error('Stack trace:', error.stack);
    }
    process.exit(1);
}
