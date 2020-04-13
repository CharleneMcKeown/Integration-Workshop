# Logic App Challenges

Now that you are more familiar with Logic Apps, here are some challenges to try out.  These challenges are designed to be unguided, and importantly, there is no absolute *right* solution.

Naturally, some of the built in Logic App connectors will be more suitable than others, but the goal here is to learn more about Logic Apps,not to get to a *right* solution. 

At the end of this document you will find some links that may be useful. You should expect to have to do some searching of documentation to achieve this challenge if you are fairly new to Logic Apps.


## Challenge 1

### Scenario

Imagine you are receiving images of new products from a partner for display on your website. These images are dropped into a storage account or perhaps an SFTP server. The images then need to be processed to convert them to suitably sized thumbnails for use on your commercial website.

Currently, an operator has to manually check the storage account or SFTP server for new images and occasionally images are getting missed and not processed.

Your challenge is to improve the process using Logic Apps!



### Objectives

1. You must design a Logic App that will create a thumbnail from an image that is uploaded to a storage account.

1. This must happen automatically, whenever new images are detected. 

1. You need to save the new thumbnail somewhere and be able to create a shareable link. This link should be consumable by a website content administrator. You can share it however you like (e.g. via email, Teams message).



## Challenge 2


### Scenario

Your organisation currently has an application that polls a service bus queue at fixed intervals for new messages.  It then carries out some processing, and calls out to other systems as part of this processing.

An operator has noted that some messages are being completed in the service bus queue, but downstream applications have not been invoked, resulting in missed messages. 

You must design a Logic App to improve this process and ensure that messages are either completed or send to a dead letter queue.

### Objectives

1. You must design a Logic App that will fetch service bus messages from a queue when a new message is detected. To make this more efficient, the process should only run when there is a new message event (think push rather than polling).
1. The Logic App must have some mechanism by which it can complete the message if processing succeeds, or instead send the message to a dead letter queue for later processing. 

>Note: The processing of the message does not have to be real; have some 'process' that you can easily make fail to demonstrate the dead letter capability. 

>Note: You may find documentation around exception handling useful - https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-exception-handling


## Challenge 3

### Scenario

You work in the customer relations team of an online retailer.  Your website has had some downtime recently which has negatively impacted the customer experience. You don't have a dedicated social media team and are usually finding out too late that your brand has been amassing negative tweets during the outage.  

You have been tasked with creating a process that will automatically alert your team when somebody posts a negative tweet about your brand. 

Positive tweets should also be detected and stored for later processing. 

### Objectives

1. You must design a Logic App that triggers when a tweet with a particular #tag is posted 

    >Note: Use anything for this example - something topical can be useful so you know it will trigger quickly!

1. Your Logic App must call out to some service to do sentiment analysis on the tweets

1. If the sentiment is positive, then the tweet information should be stored somewhere

1. If the sentiment is negative, a human should be communicated to about the tweet. This communication should contain at minimum the tweet text, the sentiment score and the user who posted it.   

    >Note: How would you want someone to be notified? Email, Teams channel? 


## Useful links

Azure Cognitive Services:
https://docs.microsoft.com/en-us/azure/cognitive-services/

https://docs.microsoft.com/en-us/azure/cognitive-services/computer-vision/

https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/

Create a Cognitive Services account:
https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Cwindows

Logic App Connectors:
https://docs.microsoft.com/en-gb/connectors/

Create a Storage Account:
https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal