class EntriesController < ApplicationController


    def show
        entry = Entry.find_by(:id => params[:id].to_i)
        render json: entry
    end

    def create
        #binding.pry
        if Entry.find_by(:term => entry_params[:term])
            entry = Entry.find_by(:term => entry_params[:term])
            redirect_to "/entries/#{entry.id}"
        else
            entry = Entry.create(entry_params)
            render json: entry
        end
    end

    private

    def user_params
        params.require(:entry).permit(:term)
    end


end
