# Integration Workshop (Incomplete!)

>Note: Todo: Blurb about integration services -- and describe the below pic and how this lab will build it:

<img src="imgs/architecture.png">

## Lab 1: Service Bus and Event Grid

>Note: Blurb about service bus and event grid!

### Create resources

1. Log into the Azure portal and click on **Create a resource**:

<img src="imgs/Create.PNG">

2. Search for **Service Bus**, select it, and then hit the **Create** button:

<img src="imgs/CreateSB.PNG">

3. Enter a **unique name** for your service bus, select the **standard** pricing tier and create a new **resource group** - call it anything you like, and choose a **location**.

<img src="imgs/CreateSB2.PNG">

4. Click the create button. Wait a few minutes for it to create, then go to it. If you're not sure, type **Service Bus** in the search bar at the top of the Azure portal, and you should see it there.

5. Take a moment to explore the **Overview** page. Click **+Queue** at the top. 

<img src="imgs/Queue.PNG">

6. Call your queue **orders** and leave everything else on default / unchecked and hit **Create**.  At this point, feel free to check out the [documentation](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-queues-topics-subscriptions#queues) on Service Bus queues, and some of the features available. 

7. Click on your newly created queue to observe the dashboard for it - it should be empty.  

<img src="imgs/QueueStats.PNG">

**Let's start sending messages to it!**

8. We will need a connection string to be able to send messages to the service bus queue, so click on **Shared Access Policies**, then **RootManageSharedAccessKey**.  Copy the **Primary Connection String** and paste it into notepad, as we will need it throughout this lab.

<img src="imgs/conn.PNG">

9. Let's deploy an Azure Function. 

>Note: What is a Function.. what is this function going to do etc.. 

10. tbd.. need to include Function code, and instructions on creating the output binding to service bus. 

### Examine messages with Service Bus Explorer

>Note: what is service bus explorer.. including link to GitHub repo. 

1. Click [here](https://github.com/paolosalvatori/ServiceBusExplorer/releases/download/4.1.112/ServiceBusExplorer-4.1.112.zip) to download Service Bus Explorer.  Extract the files and double click on ServiceBusExplorer.exe to run. 

2. Click **File** and choose **Enter connection string** from the dropdown.  Paste in your primary connection string that you saved earlier in the box when it appears on the right hand side.

<img src="imgs/sbe1.PNG">

3. You will see your service bus and its properties - in this case, we can see a service namespace and a queue called **orders**. You should see some orders in the queue. Click on **Messages** to examine some of these.

<img src="imgs/sbe2.PNG">

We just want to peek at the messages for now, so leave the defaults here and click **Ok**.

<img src="imgs/sbe3.PNG">

<img src="imgs/sbe4.PNG">

You will see a list of orders, with JSON formatted content.  Each message has a **MessageId**, a **Sequence order** and **Size**, amongst other attributes.

>Note: should prob add some additional tasks to send and receive test msgs directly from SBE. 

### Event Grid integration

So now we have messages flowing from an Azure Function into your Service Bus queue. What we need to do now is have some other service pick up those messages as and when they arrive.

>Note: Polling vs Pushing - description

1. Navigate back to the Azure portal, and click on **Create Resource** just like earlier. Search for **Logic App** and select **Logic App**. 

2. Select your subscription and your resource group and give your Logic App a name, something like **order-process**. Select the same region you used before, and optionally, enable **Log Analytics**. Click **Create**.

<img src="imgs/logicapp.PNG">

After a few moments, your Logic App should be created. 

3. Navigate to your new Logic App, and you should automatically see the Designer screen. If not, click **Designer** on the left hand pane. We want the Logic App to process an order as and when they come in, using a push strategy.  

You will notice this screen:

<img src="imgs/logicapp2.PNG">

There are two triggers of interest:

**- When a message is recieved in a Service Bus Queue** and
**- When an Event Grid resource event occurs**

We could use either, however - the first trigger uses a polling method under the covers, and we already know that a push method is more efficient. By reacting to a resource event using the Event Grid trigger, we can do this.

4. Choose the **Event Grid resource event** trigger and follow the instructions on the next screen to sign into your Azure tenant (click the + icon). Once you have done that, select **Continue**.


<img src="imgs/logicapp3.PNG">


5. You should now see a list of fields that we need to complete.  Choose your subscription, and for Resource Type, choose **Microsoft.ServiceBus.Namespaces**. Choose your service bus in the next field, and finally add an event type of **Microsoft.ServiceBus.ActiveMessagesAvailableWithNoListeners**. 

<img src="imgs/logicapp4.PNG">

6. Click on **+ New Step**. 