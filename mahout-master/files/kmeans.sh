hadoop fs -mkdir -p /user/root/testdata
hadoop fs -put synthetic_control.data /user/root/testdata
mahout -core  org.apache.mahout.clustering.syntheticcontrol.kmeans.Job
