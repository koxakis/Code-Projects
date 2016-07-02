#include <SDL2/SDL.h>

#include "../headers/graphics.h"
/* Graphics class
 *	Info for game Graphics
 */

Graphics::Graphics() {
	SDL_CreateWindowAndRenderer(640, 480, 0, &this->_window, &this->_renderer);
	SDL_SetWindowTitle(this->_window, "Beat the cancer games");
}

Graphics::~Graphics() {
	SDL_DestroyWindow(this->_window);
}
