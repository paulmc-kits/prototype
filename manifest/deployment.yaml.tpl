apiVersion: apps/v1
kind: Deployment
metadata:
  name: prototype
  labels:
    app: prototype
    app.kubernetes.io/name: prototype
spec:
  selector:
    matchLabels:
      app: prototype
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 0
      maxUnavailable: 1
  template:
    metadata:
      labels:
        app: prototype
    spec:
      #serviceAccountName: ckanserviceaccount
      containers:
        - name: prototype
      #    image: europe-west2-docker.pkg.dev/fleet-coyote-341511/nap-theme/prototype:$SHORT_SHA' 
          image: europe-west2-docker.pkg.dev/fleet-coyote-341511/nap-theme/prototype:c242c91
          resources:
            limits:
               #memory: 512Mi
               #cpu: 750m
            requests:
               #memory: 128Mi
               #cpu: 500m
          ports:
           - name: prototype-app
             containerPort: 3000
             protocol: TCP
#          readinessProbe:
#            tcpSocket:
#              port: prototype-app
#            initialDelaySeconds: 5
#            periodSeconds: 10
#          livenessProbe:
#            httpGet:
#              path: /
#              port: prototype-app
#              httpHeaders:
#              - name: Accept
#                value: "*/*"
#            initialDelaySeconds: 15
#            periodSeconds: 15
