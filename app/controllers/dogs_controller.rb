class DogsController < ApplicationController
   before_action :set_dog, only: [:show]
    def index 
        @dogs = Dog.all
    end 

    def show  
    end 

    private 

    def dog_params 
        params.require(:dog).permit(:name, :breed, :age)
    end 

    def set_dog 
        @dog = Dog.find(params[:id])
    end 

end 
