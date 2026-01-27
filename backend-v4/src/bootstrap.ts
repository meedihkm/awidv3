/**
 * Bootstrap file to register tsconfig paths before loading the application
 */
import { resolve } from 'path';
import { register } from 'tsconfig-paths';

// Register tsconfig paths for runtime
register({
    baseUrl: resolve(__dirname),
    paths: {
        '@/*': ['./*'],
        '@domain/*': ['./domain/*'],
        '@application/*': ['./application/*'],
        '@infrastructure/*': ['./infrastructure/*'],
        '@presentation/*': ['./presentation/*'],
        '@shared/*': ['./shared/*'],
        '@config/*': ['./config/*'],
    },
});

// Now import and start the application
import('./main');
