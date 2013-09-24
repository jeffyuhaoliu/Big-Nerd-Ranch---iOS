//
//  QuizViewController.m
//  Quiz
//
//  Created by Jeff Y Liu on 9/23/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

// The model objects
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

// The view outlets
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

// Controller state
@property (nonatomic) int currentQuestionIndex;

@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Create two arrays filled with questions and answers
        // make the pointers point to them
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // This sends the message to the "showQuestion" method, pass in "nil" when the sender is itself
    [self showQuestion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Target: whatever you drag to, Action: whatever you drag to
- (void)showQuestion:(id)sender {
    // Step to the next question
    self.currentQuestionIndex++;
    
    // Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Log the string to the console
    NSLog(@"displaying question: %@", question);
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Clear the answer label
    self.answerLabel.text = @"???";
}

- (void)showAnswer:(id)sender {
    // What is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answer label
    self.answerLabel.text = answer;
}
@end
