# FOS (Failure or Success) - Dart Package

FOS is a Dart package designed to help you handle errors and successes in your applications in a structured and manageable way. It provides a mechanism for encapsulating both failures and successes, making error handling cleaner and more consistent across your codebase.


## Features

-   ** ✅ Structured Error Handling**: FOS provides a structured way to handle errors and successes, making your code more readable and maintainable.
-   ** ✅ Custom Error Handling**: You can define custom error types and map them to specific exceptions or error conditions in your application.
-   ** ✅ Consistent API**: FOS ensures a consistent API for handling both failures and successes, simplifying error management across your codebase.

## Usage

### Handling Failures

To return a failure, use the `Fos.failure(MyFailure())` factory method:

    Success<UserEntity> findUser({String? params}) async {  
       try {  
         final user = await someFunction();
         return Fos.success(user);  
       }  on SerializationException {  
		 return Fos.failure(SerializationFailure(message:"xxxx"));  
       } on ServerException {
         return Fos.failure(ServerFailure(message: "xxxx",code: 500));  
       }
    }
### Handling Successes

To return a success, use the `Fos.success(MyObject)` factory method:

    try {
      final user = await someFunction();
      return Fos.success(user);
    } catch (e) {
      return Fos.toFailure(e);
    }

### Checking Result Status

You can check whether the result is a failure or success using the `isFailure` and `isSuccess` properties:

    final result = await someFunction();
    if (result.isFailure) {
      // Handle failure
    } else {
      // Handle success
    }

### Handling Results

You can handle both failure and success using the `on` method:

    final result = await someFunction();
    result.on(
      (failure) {
        // Handle failure
      },
      (success) {
        // Handle success
      },
    );

## Custom Errors

You can define custom error types by extending the `Failure` , `Exceptions` class and providing your own implementation:

**custom exception**

     class MyCustomException extends Exceptions {  
    	  const ServerException({  
    	     super.message,  
    		 super.error,  
    	  });  
     }


** custom failure**

      class MyCustomFailure extends Failure {  
    	      const MyCustomFailure({  
    		        super.message,  
    		        super.code,  
    	       });  
      }


## Initialization

Before using FOS, you can initialize custom errors using the `initErrors` method:

dartCopy code

    `Fos.initErrors({
      Custom1Exception(): Custom1Failure(),
      Custom2Exception(): Custom2Failure(),
    });`

or
Add errors to the existing errors.

    static addErrors(Map<Object, Failure> errors) {  
      _errors.addAll({Custom2Exception(): Custom2Failure()});  
    }

