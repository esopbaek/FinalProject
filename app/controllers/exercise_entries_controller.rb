class ExerciseEntriesController < ApplicationController
  
  def new
    @exercise_entry = ExerciseEntry.new
    @exercises = CardioExercise.all
    @page = ExerciseDiaryPage.find(params[:exercise_diary_page_id])
  end
  
  def create
    @page = ExerciseDiaryPage.find(params[:exercise_diary_page_id])
    
    params.require(:exercise_diary_page)["exercise_ids"].each do |id|
      exercise = @page.exercise_entries.new(cardio_exercise_id: id)
    end
    
    if @page.save
      redirect_to exercise_diary_page_url(@page)
    else
      flash.now[:errors] = @page.errors.full_messages
    end
  end
  
  def destroy
    @page = ExerciseDiaryPage.find(params[:exercise_diary_page_id])
    @entry = ExerciseEntry.find(params[:id])
    @entry.destroy
    redirect_to exercise_diary_page_url(params[:exercise_diary_page_id])
  end
  
  private
  def exercise_entry_params
    params.require(:exercise_entries).permit(:cardio_exercise_ids)
  end
  
end
