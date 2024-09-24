from flask import *
from database import*
import uuid
from newcnn import *
import random
# from pred import pred
from medicne import *
from keras import backend as K

user=Blueprint('user',__name__)

@user.route('/user_home')
def user_home():
	return render_template("user_home.html")


@user.route('/user_send_complaints',methods=['get','post'])
def user_send_complaints():
	data={}
	uid=session['uid']

	if 'submit' in request.form:
		
		complaint=request.form['Complaint']
		q="INSERT INTO `enquiry`VALUES(null,'%s','%s','pending',NOW())"%(uid,complaint)
		insert(q)

		flash("massage send Successfully")

		return redirect(url_for('user.user_send_complaints'))

	q="SELECT * FROM `enquiry` WHERE `user_id`='%s'"%(uid)
	res=select(q)
	data['complaints']=res
	return render_template("user_send_complaints.html",data=data)


@user.route('/user_upload_file',methods=['get','post'])
def user_upload_file():
	K.clear_session()
	data={}
	uid=session['uid']
	if 'upload' in request.form:
		file=request.files['file']
		path='static/uploads'+str(uuid.uuid4())+file.filename
		file.save(path)
		n='Normal'
		val=''
		s=preprocess_image(path)

		if s=='Astrocitoma':
			val_options = ['Mild Astrocitoma', 'Moderate Astrocitoma', 'Moderately Severe Astrocitoma', 'Severe Astrocitoma']
			val = random.choice(val_options)
		elif s=='Glioma':	
			val_options = ['Mild Glioma', 'Moderate Glioma', 'Moderately Severe Glioma', 'Severe Glioma']
			val = random.choice(val_options)
		elif s=='Meduloblastoma':
			val_options = ['Mild Meduloblastoma', 'Moderate Meduloblastoma', 'Moderately Severe Astrocitoma', 'Severe Meduloblastoma']
			val = random.choice(val_options)
		elif s=='meningioma':
			val_options = ['Mild meningioma', 'Moderate meningioma', 'Moderately Severe meningioma', 'Severe meningioma']
			val = random.choice(val_options)
		elif s=='Normal':
			val="Normal"
		elif s=='notumor':
			val="notumor"
		elif s=='pituitary':
			val_options = ['Mild Astrocitoma', 'Moderate Astrocitoma', 'Moderately Severe Astrocitoma', 'Severe Astrocitoma']
			val = random.choice(val_options)
		print(s)
		q="insert into upload_file values(null,'%s','%s','%s','%s')"%(uid,path,s,val)
		insert(q)
		flash("Added Successfully.......!")
		return redirect(url_for('user.user_upload_file'))

	q="select * from upload_file WHERE user_id='%s'"%(uid)
	res=select(q)
	data['upload']=res
	return render_template("user_upload_file.html",data=data)

@user.route('/user_view_disease',methods=['get','post'])
def user_view_disease():
	data={}
	q="SELECT * FROM `disease` INNER JOIN `medicine` USING(`disease_id`) INNER JOIN `symptoms` USING(`disease_id`)"
	data['view']=select(q)
	return render_template('user_view_disease.html',data=data)

@user.route('/user_basic_details', methods=['get', 'post'])
def user_basic_details():
	data = {}
	K.clear_session()
	input_disease=request.args['name']
	data['name']=input_disease
	print("my name issss",input_disease)
	if 'submit' in request.form:
	# 	input_disease = request.form['name']
		input_age = request.form['age']
		out=predictions(input_disease,input_age)
		q = "INSERT INTO `predict_medicine` VALUES(NULL, '%s', '%s', '%s', '%s')" % (
			session['uid'], input_disease, input_age, out)
		insert(q)
	q = "SELECT * FROM `predict_medicine` where disease='%s'"%(input_disease)
	data['view'] = select(q)
	return render_template('user_basic_details.html', data=data,input_disease=input_disease)