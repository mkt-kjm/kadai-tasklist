class TasksController < ApplicationController
  
  # model"Task"に対するController
  
  def index
    @tasks = Task.all
  end
  
  #id　詳細ページ指定
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  # newページより送られてきたフォームの処理
  def create
    @task = Task.new(task_params)
    if @task.save
      #flashページ作る必要あり
      flash[:success] = "Taskが登録されました"
      
      #該当する詳細ページへ遷移
      redirect_to @task
      
    else
      flash.now[:danger] = "Taskが登録できませんでした"
      
      #新規作成ページを表示
      render :new
    end
  end
  
  #既存タスクの編集ページ
  def edit
    @task = Task.find(params[:id])
  end
  
  #既存タスクの更新処理
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:sucess] = "タスクが正常に編集されました"
      redirect_to tasks_path
    else
      flas.now[:danger] = "タスクが編集できませんでした"
      render edit_task_path
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクは正常に削除されました"
    redirect_to tasks_path
  end
  
  #strong parameter
  #セキュリティ強固のため、フィルター作成
  def task_params
    # params.require(:message)でTaskモデルのフォームから得られるものに限定
    # .permit(:content)で必要なカラムを選択
    
    params.require(:task).permit(:content)
  end
end